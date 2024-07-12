import '../models/types_and_features_model.dart';

abstract class TypesAndFeaturesEvent {}

class FetchTypesAndFeatures extends TypesAndFeaturesEvent {}

class FetchVolcanoDetails extends TypesAndFeaturesEvent {
  final TypesAndFeaturesModel model;
  final String url;

  FetchVolcanoDetails(this.model, this.url);
}
