class VolcanoModel {
  final String name;
  final String country;
  final String type;
  final String eruption;
  final String latitude;
  final String longitude;
  final String summit;
  final String elevation;
  final String summary;
  final String? image;
  final EruptiveHistory? history;
  final DeformationHistory? deformationHistory;
  final EmissionHistory? emissionHistory;
  final List<SynonymsModel> conesModel;
  final List<SynonymsModel> cratersModel;
  final List<SynonymsModel> domesMode;

  VolcanoModel(
      {required this.name,
      required this.country,
      this.history,
      required this.conesModel,
      required this.cratersModel,
      required this.domesMode,
      this.deformationHistory,
      this.emissionHistory,
      required this.image,
      required this.type,
      required this.eruption,
      required this.latitude,
      required this.longitude,
      required this.summit,
      required this.elevation,
      required this.summary});
}

class EruptiveHistory {
  final String place;
  final String eruption;
  final String desc;
  final String startDate;
  final String endDate;
  final String eventType;

  EruptiveHistory(
      {required this.place,
      required this.eruption,
      required this.desc,
      required this.endDate,
      required this.eventType,
      required this.startDate});
}

class DeformationHistory {
  final String startDate;
  final String stopDate;
  final String direction;
  final String method;
  final String magnitude;
  final String spatialExtend;

  DeformationHistory(
      {required this.startDate,
      required this.stopDate,
      required this.direction,
      required this.method,
      required this.magnitude,
      required this.spatialExtend});
}

class EmissionHistory {
  final String startDate;
  final String stopDate;
  final String method;
  final String altitudeMin;
  final String altitudeMax;
  final String totalMass;

  EmissionHistory(
      {required this.startDate,
      required this.stopDate,
      required this.method,
      required this.altitudeMin,
      required this.altitudeMax,
      required this.totalMass});
}

class SynonymsModel {
  final String featureName;
  final String featureType;
  final String elevation;
  final String latitude;
  final String longitude;

  SynonymsModel(
      {required this.featureName,
      required this.featureType,
      required this.elevation,
      required this.latitude,
      required this.longitude});
}
