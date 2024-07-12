import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:volcano/data/assets.dart';
import 'package:volcano/ui/widgets/buttons/click_area.dart';

import '../../../../data/styles.dart';
import '../../../widgets/bottom_sheet.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';
import 'filter_by.dart';
import 'sort_by.dart';

class HomeFilters extends StatelessWidget {
  const HomeFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeBloc>(builder: (context, bloc, _) {
      return StreamBuilder<HomeSuccess>(
          stream: bloc.successStream,
          initialData: bloc.successState,
          builder: (context, snapshot) {
            HomeSuccess state = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Row(
                children: [
                  _SmallButtons(
                      name: 'Filter',
                      icon: DAssetIcons.filter,
                      callback: () {
                        showCustomBottomSheet(
                            context: context,
                            child: HomeFilterBy(
                                models: state.models,
                                model: state.filterModel,
                                callback: (model) => bloc.sink
                                    .add(HomeUpdateFilterModel(model))));
                      }),
                  const SizedBox(width: kDefaultPadding / 2),
                  _SmallButtons(
                      name: 'Sort By',
                      icon: DAssetIcons.sort,
                      callback: () {
                        showCustomBottomSheet(
                          context: context,
                          child: HomeSortByView(
                              model: state.filterModel,
                              callback: (model) =>
                                  bloc.sink.add(HomeUpdateFilterModel(model))),
                        );
                      }),
                ],
              ),
            );
          });
    });
  }
}

class _SmallButtons extends StatelessWidget {
  final VoidCallback callback;
  final String name;
  final String icon;

  const _SmallButtons(
      {Key? key,
      required this.callback,
      required this.name,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClickArea(
        onTap: callback,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 4),
          decoration: BoxDecoration(
              borderRadius: kSmallBorderRadius,
              color: Theme.of(context).colorScheme.secondary),
          child: Row(
            children: [
              Text(name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: kWhiteText)),
              const SizedBox(width: kDefaultPadding / 4),
              SvgPicture.asset(icon),
            ],
          ),
        ));
  }
}
