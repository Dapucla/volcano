import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/data/styles.dart';
import 'package:volcano/ui/widgets/buttons/click_area.dart';

import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';

class SVSelectView extends StatelessWidget {
  const SVSelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: kSmallBorderRadius,
      ),
      child: Consumer<SVBloc>(builder: (context, bloc, _) {
        return StreamBuilder<SVSuccess>(
            stream: bloc.successStream,
            initialData: bloc.successState,
            builder: (context, snapshot) {
              SVSuccess state = snapshot.data!;
              return IntrinsicHeight(
                child: Row(children: [
                  Expanded(
                      child: _Element(
                    text: 'Information',
                    onTap: () => bloc.sink.add(SVSelectType(SVViewType.info)),
                    activity: state.type == SVViewType.info,
                  )),

                  if (state.type == SVViewType.synonyms)
                    const VerticalDivider(
                        color: Color.fromRGBO(194, 194, 194, 1),
                        indent: 5,
                        width: 0,
                        endIndent: 5),
                  Expanded(
                      child: _Element(
                    text: 'History',
                    onTap: () =>
                        bloc.sink.add(SVSelectType(SVViewType.history)),
                    activity: state.type == SVViewType.history,
                  )),
                  if (state.type == SVViewType.info)
                    const VerticalDivider(
                        color: Color.fromRGBO(194, 194, 194, 1),
                        indent: 5,
                        width: 0,
                        endIndent: 5),
                  Expanded(
                      child: _Element(
                    text: 'Synonyms',
                    onTap: () =>
                        bloc.sink.add(SVSelectType(SVViewType.synonyms)),
                    activity: state.type == SVViewType.synonyms,
                  )),
                ]),
              );
            });
      }),
    );
  }
}

class _Element extends StatelessWidget {
  final bool activity;
  final String text;
  final VoidCallback onTap;

  const _Element(
      {Key? key,
      this.activity = false,
      required this.text,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClickArea(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        decoration: activity
            ? BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: kSmallBorderRadius)
            : null,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 14,
              color: activity ? kWhiteText : null,
              fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
