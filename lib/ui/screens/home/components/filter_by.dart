import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volcano/ui/screens/home/bloc/event.dart';
import 'package:volcano/ui/widgets/buttons/continue.dart';

import '../../../../data/styles.dart';
import '../../../../models/volcanes_list_model.dart';
import '../../../widgets/buttons/click_area.dart';

enum FilterByType { init, subregion, evidence, volcanoType }

class HomeFilterBy extends StatefulWidget {
  final List<VolcanesListModel> models;
  final FilterModel model;
  final Function(FilterModel model) callback;

  const HomeFilterBy(
      {Key? key,
      required this.models,
      required this.model,
      required this.callback})
      : super(key: key);

  @override
  State<HomeFilterBy> createState() => _HomeFilterByState();
}

class _HomeFilterByState extends State<HomeFilterBy> {
  late ValueNotifier<FilterByType> filterByType;
  late FilterModel model;

  @override
  void initState() {
    model = widget.model;
    filterByType = ValueNotifier(FilterByType.init);
    super.initState();
  }

  @override
  void dispose() {
    filterByType.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: ValueListenableBuilder(
          valueListenable: filterByType,
          builder: (context, type, _) {
            return Column(children: [
              _Title(
                onBack: () => filterByType.value = FilterByType.init,
                type: type,
                onClear: () {
                  model.subregion = null;
                  model.volcanoType = null;
                  model.evidence = null;
                },
              ),
              Expanded(child: Builder(
                builder: (context) {
                  switch (type) {
                    case FilterByType.init:
                      return Column(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                _InitItem(
                                    name: 'Subregion',
                                    onTap: () => filterByType.value =
                                        FilterByType.subregion),
                                _InitItem(
                                    name: 'Volcano Type',
                                    onTap: () => filterByType.value =
                                        FilterByType.volcanoType),
                                _InitItem(
                                    name: 'Evidence',
                                    onTap: () => filterByType.value =
                                        FilterByType.evidence),
                              ],
                            ),
                          ),
                          DContinueButton(
                              onTap: () {
                                widget.callback(model);
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                              },
                              name: 'Show Results')
                        ],
                      );
                    case FilterByType.subregion:
                      return _BuildList(
                        selectedValues: model.subregion,
                        callback: (model) {
                          if (model != null) {
                            this.model = this.model.copyWith(subregion: model);
                          } else if (this.model.subregion != null) {
                            this.model.subregion = null;
                          }
                          filterByType.value = FilterByType.init;
                        },
                        values: getListSubregion(),
                      );
                    case FilterByType.evidence:
                      return _BuildList(
                        selectedValues: model.evidence,
                        callback: (model) {
                          if (model != null) {
                            this.model = this.model.copyWith(evidence: model);
                          } else if (this.model.evidence != null) {
                            this.model.evidence = null;
                          }
                          filterByType.value = FilterByType.init;
                        },
                        values: getListEvidence(),
                      );
                    case FilterByType.volcanoType:
                      return _BuildList(
                        selectedValues: model.volcanoType,
                        callback: (model) {
                          if (model != null) {
                            this.model =
                                this.model.copyWith(volcanoType: model);
                          } else if (this.model.volcanoType != null) {
                            this.model.volcanoType = null;
                          }

                          filterByType.value = FilterByType.init;
                        },
                        values: getListType(),
                      );
                  }
                },
              )),
            ]);
          }),
    );
  }

  List<String> getListSubregion() {
    List<String> result = [];
    for (var element in widget.models) {
      if (!result.contains(element.subregion)) {
        result.add(element.subregion.toString());
      }
    }
    return result;
  }

  List<String> getListEvidence() {
    List<String> result = [];
    for (var element in widget.models) {
      if (!result.contains(element.evidence)) {
        result.add(element.evidence.toString());
      }
    }
    return result;
  }

  List<String> getListType() {
    List<String> result = [];
    for (var element in widget.models) {
      if (!result.contains(element.type)) {
        result.add(element.type.toString());
      }
    }
    return result;
  }
}

class _InitItem extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const _InitItem({Key? key, required this.name, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClickArea(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Color.fromRGBO(161, 157, 157, 1), width: 0.5))),
        child: Row(
          children: [
            Expanded(child: Text(name)),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Color.fromRGBO(161, 157, 157, 1),
            )
          ],
        ),
      ),
    );
  }
}

class _BuildList extends StatefulWidget {
  final List<String> values;
  final List<String>? selectedValues;
  final Function(List<String>? model) callback;

  const _BuildList(
      {Key? key,
      required this.values,
      required this.callback,
      required this.selectedValues})
      : super(key: key);

  @override
  State<_BuildList> createState() => _BuildListState();
}

class _BuildListState extends State<_BuildList> {
  late ValueNotifier<List<String>> selectedValue;

  @override
  void initState() {
    selectedValue = ValueNotifier(widget.selectedValues ?? []);
    super.initState();
  }

  @override
  void dispose() {
    selectedValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: selectedValue,
              builder: (context, list, _) {
                return ListView.builder(
                  itemCount: widget.values.length,
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  itemBuilder: (context, index) {
                    bool active = list.contains(widget.values[index]);
                    return Padding(
                      padding: const EdgeInsets.only(top: kDefaultPadding),
                      child: ClickArea(
                        onTap: () {
                          if (!active) {
                            selectedValue.value.add(widget.values[index]);
                          } else {
                            selectedValue.value.removeWhere(
                                (element) => element == widget.values[index]);
                          }
                          selectedValue.notifyListeners();
                        },
                        child: Row(
                          children: [
                            Expanded(child: Text(widget.values[index])),
                            const SizedBox(width: kDefaultPadding / 2),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  color: active
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context)
                                          .colorScheme
                                          .background,
                                  shape: BoxShape.circle,
                                  border: !active ? Border.all() : null),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
        ),
        DContinueButton(
            onTap: () {
              widget.callback(
                  selectedValue.value.isNotEmpty ? selectedValue.value : null);
            },
            name: 'Apply')
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final FilterByType type;
  final VoidCallback onClear;
  final VoidCallback onBack;

  const _Title(
      {Key? key,
      required this.type,
      required this.onClear,
      required this.onBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ClickArea(
                child: Icon(type == FilterByType.init
                    ? CupertinoIcons.clear
                    : CupertinoIcons.back),
                onTap: () {
                  if (type == FilterByType.init) {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  } else {
                    onBack();
                  }
                }),
          ),
          Center(
              child: Text(
                  type == FilterByType.init
                      ? 'Filter'
                      : type == FilterByType.evidence
                          ? 'Evidence'
                          : type == FilterByType.subregion
                              ? 'Subregion'
                              : 'Volcano Type',
                  style: Theme.of(context).textTheme.headlineMedium)),
          Align(
            alignment: Alignment.centerRight,
            child: ClickArea(
              onTap: onClear,
              child: Text('Clear all',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary)),
            ),
          )
        ],
      ),
    );
  }
}
