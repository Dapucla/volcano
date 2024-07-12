import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:volcano/data/assets.dart';
import 'package:volcano/data/styles.dart';

import '../bloc/bloc.dart';
import '../bloc/state.dart';

class SVInfoView extends StatelessWidget {
  const SVInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SVBloc>(builder: (context, bloc, _) {
      return StreamBuilder<SVSuccess>(
          stream: bloc.successStream,
          initialData: bloc.successState,
          builder: (context, snapshot) {
            SVSuccess state = snapshot.data!;
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text(state.model.summary),
                ),
                const SizedBox(height: kDefaultPadding),
                _Element(name: 'Name:', value: state.model.name),
                _Element(name: 'Country:', value: state.model.country),
                _Element(
                    name: 'Last known erruption:', value: state.model.eruption),
                _Element(name: 'Latitide', value: state.model.latitude),
                _Element(name: 'Longitude', value: state.model.longitude),
                _Element(name: 'Summit', value: state.model.summit),
                _Element(name: 'Elevation', value: state.model.elevation),
                const SizedBox(height: kDefaultPadding / 2),
                _Map(
                    latLng: LatLng(
                        double.tryParse(
                                state.model.latitude.split('°').first) ??
                            0,
                        double.tryParse(
                                state.model.longitude.split('°').first) ??
                            0))
              ],
            );
          });
    });
  }
}

class _Map extends StatelessWidget {
  final LatLng latLng;

  const _Map({Key? key, required this.latLng}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Text('Geolocation',
              style: Theme.of(context).textTheme.headlineMedium),
        ),
        SizedBox(
          height: 300,
          child: FlutterMap(
            options: MapOptions(initialCenter: latLng, initialZoom: 9.2),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'volcano.vigiltracker.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: latLng,
                    width: 25,
                    height: 25,
                    child: SvgPicture.asset(DAssetIcons.marker),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
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
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Color.fromRGBO(194, 194, 194, 1))),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Text(name,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w300)),
        ),
        Expanded(
          child: Text(value,
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
      ]),
    );
  }
}
