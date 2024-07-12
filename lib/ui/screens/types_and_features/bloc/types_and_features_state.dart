import '../models/types_and_features_model.dart';

abstract class TypesAndFeaturesState {}

class TypesAndFeaturesInitial extends TypesAndFeaturesState {}

class TypesAndFeaturesLoading extends TypesAndFeaturesState {}

class TypesAndFeaturesLoaded extends TypesAndFeaturesState {
  final List<TypesAndFeaturesModel> types;

  TypesAndFeaturesLoaded(this.types);
}

class TypesAndFeaturesDetailsLoaded extends TypesAndFeaturesState {
  final TypesAndFeaturesModel model;

  TypesAndFeaturesDetailsLoaded(this.model);
}

class TypesAndFeaturesError extends TypesAndFeaturesState {
  final String message;

  TypesAndFeaturesError(this.message);
}
