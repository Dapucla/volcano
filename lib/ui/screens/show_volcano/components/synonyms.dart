import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/styles.dart';
import '../../../../models/volcano.dart';
import '../bloc/bloc.dart';
import '../bloc/state.dart';

class SvSynonymsView extends StatelessWidget {
  const SvSynonymsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SVBloc>(builder: (context, bloc, _) {
      return StreamBuilder<SVSuccess>(
          stream: bloc.successStream,
          initialData: bloc.successState,
          builder: (context, snapshot) {
            SVSuccess state = snapshot.data!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.all(kDefaultPadding).copyWith(bottom: 0),
                  child: Text('Cones',
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
                if (state.model.conesModel.isNotEmpty)
                  ...state.model.conesModel.map((e) => _Builder(model: e))
                else
                  _NotFound(historyName: 'Cones', name: state.model.name),
                Padding(
                  padding:
                      const EdgeInsets.all(kDefaultPadding).copyWith(bottom: 0),
                  child: Text('Craters',
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
                if (state.model.cratersModel.isNotEmpty)
                  ...state.model.cratersModel.map((e) => _Builder(model: e))
                else
                  _NotFound(historyName: 'Cones', name: state.model.name),
                Padding(
                  padding:
                      const EdgeInsets.all(kDefaultPadding).copyWith(bottom: 0),
                  child: Text('Domes',
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
                if (state.model.domesMode.isNotEmpty)
                  ...state.model.domesMode.map((e) => _Builder(model: e))
                else
                  _NotFound(historyName: 'Cones', name: state.model.name),
              ],
            );
          });
    });
  }
}

class _Builder extends StatelessWidget {
  final SynonymsModel model;

  const _Builder({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(194, 194, 194, 1)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.featureName.replaceAll('\n', '').substring(13),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(model.featureType,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.w300)),
          ),
          _Element(
            name: 'Elevation',
            value:
                model.elevation.isNotEmpty ? model.elevation : 'No Information',
          ),
          _Element(
            name: 'Latitude',
            value:
                model.latitude.isNotEmpty ? model.elevation : 'No Information',
          ),
          _Element(
            name: 'Longitude',
            value:
                model.longitude.isNotEmpty ? model.elevation : 'No Information',
          ),
        ],
      ),
    );
  }
}

class _NotFound extends StatelessWidget {
  final String historyName;
  final String name;

  const _NotFound({Key? key, required this.historyName, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Text('There is no $historyName data available for $name',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontWeight: FontWeight.w300)),
    );
  }
}

class _Element extends StatelessWidget {
  final String name;
  final String value;

  const _Element({Key? key, required this.name, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
      child: Row(
        children: [
          Expanded(
              child: Text(
            name,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w300),
          )),
          Expanded(
              child: Text(value,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.end)),
        ],
      ),
    );
  }
}
