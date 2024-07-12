import 'package:hive/hive.dart';
import 'dart:convert';

import 'package:volcano/services/hive.dart';

part 'volcanes_list_model.g.dart';

@HiveType(typeId: HiveIds.volcanesListModel)
class VolcanesListModel {
  @HiveField(1)
  final int? id;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? subregion;
  @HiveField(4)
  final String? type;
  @HiveField(5)
  final String? evidence;
  @HiveField(6)
  String? image;

  VolcanesListModel(
      {this.id,
      this.name,
      this.subregion,
      this.type,
      this.evidence,
      this.image});
}
