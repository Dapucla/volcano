import 'state.dart';

abstract class SVEvent {}

class SVSelectType extends SVEvent {
  final SVViewType type;

  SVSelectType(this.type);
}
