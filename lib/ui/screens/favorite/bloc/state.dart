import 'package:volcano/models/volcanes_list_model.dart';

abstract class FSState {}

class FSSuccess extends FSState {
  final List<VolcanesListModel> models;

  FSSuccess(this.models);
}
