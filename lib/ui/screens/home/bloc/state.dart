import 'package:volcano/models/volcanes_list_model.dart';

import 'event.dart';

abstract class HomeState {}

class HomeSuccess extends HomeState {
  final List<VolcanesListModel> models;
  FilterModel filterModel;

  List<VolcanesListModel> filteredModels() {
    List<VolcanesListModel> result = models;

    if (filterModel.search != null) {
      result = result
          .where((e) =>
              e.name!.toLowerCase().contains(filterModel.search!.toLowerCase()))
          .toList();
    }

    if (filterModel.subregion != null && filterModel.subregion!.isNotEmpty) {
      result = result
          .where((element) =>
              filterModel.subregion!.contains(element.subregion.toString()))
          .toList();
    }
    if (filterModel.evidence != null && filterModel.evidence!.isNotEmpty) {
      result = result
          .where((element) =>
              filterModel.evidence!.contains(element.evidence.toString()))
          .toList();
    }
    if (filterModel.volcanoType != null &&
        filterModel.volcanoType!.isNotEmpty) {
      result = result
          .where((element) => filterModel.volcanoType!.contains(element.type))
          .toList();
    }

    if (filterModel.sortByNameIncrease != null) {
      result.sort((a, b) {
        if (filterModel.sortByNameIncrease == true) {
          return a.name.toString().compareTo(b.name.toString());
        } else {
          return b.name.toString().compareTo(a.name.toString());
        }
      });
    }
    if (filterModel.sortBySubregionIncrease != null) {
      result.sort((a, b) {
        if (filterModel.sortBySubregionIncrease == true) {
          return a.subregion.toString().compareTo(b.subregion.toString());
        } else {
          return b.subregion.toString().compareTo(a.subregion.toString());
        }
      });
    }

    return result;
  }

  HomeSuccess filteredModel(FilterModel filterModel) {
    return HomeSuccess(models: models, filterModel: filterModel);
  }

  HomeSuccess({required this.models, required this.filterModel});
}

class HomeError extends HomeState {}
