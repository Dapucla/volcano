import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:volcano/data/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../types_and_features/bloc/types_and_features_bloc.dart';
import '../types_and_features/bloc/types_and_features_event.dart';
import '../types_and_features/bloc/types_and_features_state.dart';
import '../types_and_features/models/types_and_features_model.dart';
import '../types_and_features/services/api.dart';

import '../../widgets/border.dart';

class ShowTypesAndFeatures extends StatelessWidget {
  final TypesAndFeaturesModel model;

  const ShowTypesAndFeatures({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TypesAndFeaturesBloc>(
      create: (context) {
        final bloc = TypesAndFeaturesBloc(ApiService());
        bloc.addEvent(FetchVolcanoDetails(model, _getLinkForModel(model)));
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(model.name),
          ),
        ),
        body: Consumer<TypesAndFeaturesBloc>(
          builder: (context, bloc, child) {
            return StreamBuilder<TypesAndFeaturesState>(
              stream: bloc.stream,
              initialData: bloc.state,
              builder: (context, snapshot) {
                TypesAndFeaturesState? state = snapshot.data;
                if (state is TypesAndFeaturesDetailsLoaded) {
                  return _DetailsSuccess(state.model);
                }
                return const Center(child: CupertinoActivityIndicator());
              },
            );
          },
        ),
      ),
    );
  }

  String _getLinkForModel(TypesAndFeaturesModel model) {
    return {
      'Stratovolcanoes': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeStrato',
      'Shield Volcanoes': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeShield',
      'Calderas': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeCalderas',
      'Craters': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeCraters',
      'Fissure Vents': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeFissures',
      'Scoria Cones': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeScoria',
      'Lava Domes': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeLavaDomes',
      'Submarine Volcanoes': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeSubmarine',
      'Geothermal Features': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeGeothermal',
      'Maars': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeMaar',
      'Volcanic Fields': 'https://volcano.si.edu/gallery/ImageCollection.cfm?gallery=VolTypeVolcField',
    }[model.name]!;
  }
}

class _DetailsSuccess extends StatelessWidget {
  final TypesAndFeaturesModel model;

  const _DetailsSuccess(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [model.image_1, model.image_2, model.image_3];
    List<String> descriptions = [
      model.description_1,
      model.description_2,
      model.description_3,
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                decoration: kBoxDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Text(model.subtitle),
                    const SizedBox(height: kDefaultPadding),
                  ],
                ),
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 350,
                  viewportFraction: 0.9, // Make the next elements slightly visible
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: false,
                ),
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  // Determine left and right padding
                  double leftPadding = index == 0 ? 0 : kDefaultPadding / 4;
                  double rightPadding = index == images.length - 1 ? 0 : kDefaultPadding / 4;

                  return Padding(
                    padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          color: Theme.of(context).colorScheme.surface,
                          child: images[index].isNotEmpty
                              ? Image.network(
                            images[index],
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child; // Image is fully loaded
                              } else {
                                return const Center(
                                  child: CupertinoActivityIndicator(),
                                );
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/no_image.png', // Adjust the path to your asset
                                fit: BoxFit.cover,
                              );
                            },
                          )
                              : Image.asset(
                            'assets/no_image.png', // Adjust the path to your asset
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: kDefaultPadding / 2),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            child: SingleChildScrollView(
                              child: Text(
                                descriptions[index],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
