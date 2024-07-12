import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/data/styles.dart';
import 'package:volcano/models/volcano.dart';

import '../bloc/bloc.dart';
import '../bloc/state.dart';

class SVHistoryView extends StatelessWidget {
  const SVHistoryView({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Text('Eruptive History',
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                if (state.model.history != null)
                  _EruptiveHistory(model: state.model.history!)
                else
                  _NotFound(
                    name: state.model.name,
                    historyName: "Eruptive History",
                  ),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Text('Deformation History',
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                if (state.model.deformationHistory != null)
                  _DeformationHistory(model: state.model.deformationHistory!)
                else
                  _NotFound(
                    name: state.model.name,
                    historyName: "Deformation History",
                  ),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Text('Emission History',
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                if (state.model.emissionHistory != null)
                  _EmissionHistory(model: state.model.emissionHistory!)
                else
                  _NotFound(
                    name: state.model.name,
                    historyName: "Emissions History",
                  ),
              ],
            );
          });
    });
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
      padding: const EdgeInsets.all(kDefaultPadding).copyWith(top: 0),
      child: Text('There is no $historyName data available for $name',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontWeight: FontWeight.w300)),
    );
  }
}

class _EruptiveHistory extends StatelessWidget {
  final EruptiveHistory model;

  const _EruptiveHistory({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding).copyWith(top: 0),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(194, 194, 194, 1)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                model.place,
                style: const TextStyle(fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(model.eruption,
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontWeight: FontWeight.w600))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(model.desc,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.w300)),
          ),
          _Element(
            name: 'Start Date',
            value: model.startDate,
          ),
          _Element(
            name: 'End Date',
            value: model.endDate,
          ),
          _Element(
            name: 'Event Type',
            value: model.eventType,
          ),
        ],
      ),
    );
  }
}

class _DeformationHistory extends StatelessWidget {
  final DeformationHistory model;

  const _DeformationHistory({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding).copyWith(top: 0),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(194, 194, 194, 1)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Element(
            name: 'Start Date',
            value: model.startDate,
          ),
          _Element(
            name: 'Stop Date',
            value: model.stopDate,
          ),
          _Element(
            name: 'Direction',
            value: model.direction,
          ),
          _Element(
            name: 'Magnitude',
            value: model.magnitude,
          ),
          _Element(
            name: 'Method',
            value: model.method,
          ),
          _Element(
            name: 'Spatial Extend',
            value: model.spatialExtend,
          ),
        ],
      ),
    );
  }
}

class _EmissionHistory extends StatelessWidget {
  final EmissionHistory model;

  const _EmissionHistory({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding).copyWith(top: 0),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(194, 194, 194, 1)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Element(
            name: 'Start Date',
            value: model.startDate,
          ),
          _Element(
            name: 'Stop Date',
            value: model.stopDate,
          ),
          _Element(
            name: 'Method',
            value: model.method,
          ),
          _Element(
            name: 'SO2 Altitude Min',
            value: model.altitudeMin,
          ),
          _Element(
            name: 'SO2 Altitude Max',
            value: model.altitudeMax,
          ),
          _Element(
            name: 'Total SO2 Mass',
            value: model.totalMass,
          ),
        ],
      ),
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
