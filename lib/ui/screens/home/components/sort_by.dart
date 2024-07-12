import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volcano/data/styles.dart';
import 'package:volcano/ui/screens/home/bloc/event.dart';
import 'package:volcano/ui/widgets/buttons/click_area.dart';
import 'package:volcano/ui/widgets/buttons/continue.dart';

class HomeSortByView extends StatefulWidget {
  final Function(FilterModel model) callback;
  final FilterModel model;

  const HomeSortByView({Key? key, required this.callback, required this.model})
      : super(key: key);

  @override
  State<HomeSortByView> createState() => _HomeSortByViewState();
}

class _HomeSortByViewState extends State<HomeSortByView> {
  late ValueNotifier<FilterModel> notifier;

  @override
  void initState() {
    notifier = ValueNotifier(widget.model);
    super.initState();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: ValueListenableBuilder<FilterModel>(
          valueListenable: notifier,
          builder: (context, FilterModel model, _) {
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Stack(
                    children: [
                      ClickArea(
                          child: const Icon(CupertinoIcons.clear),
                          onTap: () => Navigator.pop(context)),
                      Center(
                          child: Text('Sort By',
                              style:
                                  Theme.of(context).textTheme.headlineMedium))
                    ],
                  ),
                ),
                _Value(
                    onTap: () {
                      notifier.value = model.copyWith(sortByNameIncrease: true);
                    },
                    active: model.sortByNameIncrease == true,
                    value: 'Name (A-Z)'),
                _Value(
                    onTap: () {
                      notifier.value =
                          model.copyWith(sortByNameIncrease: false);
                    },
                    active: model.sortByNameIncrease == false,
                    value: 'Name (Z-A)'),
                _Value(
                    onTap: () {
                      notifier.value =
                          model.copyWith(sortBySubregionIncrease: true);
                    },
                    active: model.sortBySubregionIncrease == true,
                    value: 'Subregion name (A-Z)'),
                _Value(
                    onTap: () {
                      notifier.value =
                          model.copyWith(sortBySubregionIncrease: false);
                    },
                    active: model.sortBySubregionIncrease == false,
                    value: 'Subregion name (Z-A)'),
                const SizedBox(height: kDefaultPadding * 3),
                DContinueButton(onTap: () {
                  widget.callback(model);
                  if(Navigator.canPop(context)){
                    Navigator.pop(context);
                  }
                }, name: 'Show Results')
              ],
            );
          }),
    );
  }
}

class _Value extends StatelessWidget {
  final String value;
  final bool active;
  final VoidCallback onTap;

  const _Value(
      {Key? key,
      required this.value,
      required this.active,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: ClickArea(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  color: active
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                  border: !active ? Border.all() : null),
            )
          ],
        ),
      ),
    );
  }
}
