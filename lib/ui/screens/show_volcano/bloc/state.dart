import 'package:volcano/models/volcano.dart';

abstract class SVState {}

class SVError extends SVState {}

enum SVViewType { info, history, synonyms }

class SVSuccess extends SVState {
  final VolcanoModel model;
  final SVViewType type;

  SVSuccess copyWith({SVViewType? type}) {
    return SVSuccess(model: model, type: type ?? this.type);
  }

  SVSuccess({required this.model, this.type = SVViewType.info});
}
