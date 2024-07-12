abstract class HomeEvent {}

class HomeSearch extends HomeEvent {
  final String name;

  HomeSearch(this.name);
}

class HomeUpdateFilterModel extends HomeEvent {
  final FilterModel model;

  HomeUpdateFilterModel(this.model);
}

class FilterModel {
  final String? search;
  final bool? sortBySubregionIncrease;
  final bool? sortByNameIncrease;
  List<String>? subregion;
  List<String>? volcanoType;
  List<String>? evidence;

  FilterModel copyWith(
      {String? search,
      bool? sortBySubregionIncrease,
      bool? sortByNameIncrease,
      List<String>? subregion,
      List<String>? volcanoType,
      List<String>? evidence,
      List<String>? tectonicSetting}) {
    return FilterModel(
      subregion: subregion ?? this.subregion,
      volcanoType: volcanoType ?? this.volcanoType,
      evidence: evidence ?? this.evidence,
      search: search ?? this.search,
      sortByNameIncrease: sortByNameIncrease ??
          (sortBySubregionIncrease == null ? this.sortByNameIncrease : null),
      sortBySubregionIncrease: sortBySubregionIncrease ??
          (sortByNameIncrease == null ? this.sortBySubregionIncrease : null),
    );
  }

  FilterModel({
    this.subregion,
    this.volcanoType,
    this.evidence,
    this.search,
    this.sortByNameIncrease,
    this.sortBySubregionIncrease,
    // this.tectonicSetting
  });
}

class HomeSortModels extends HomeEvent {
  final List<String>? subregion;
  final List<String>? volcanoType;
  final List<String>? evidence;
  final List<String>? rockTypes;
  final List<String>? tectonicSetting;

  HomeSortModels(
      {this.subregion,
      this.volcanoType,
      this.evidence,
      this.rockTypes,
      this.tectonicSetting});
}
