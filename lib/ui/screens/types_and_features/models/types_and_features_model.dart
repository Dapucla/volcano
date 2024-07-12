import 'package:hive/hive.dart';

part 'types_and_features_model.g.dart';

@HiveType(typeId: 0)
class TypesAndFeaturesModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String subtitle;
  @HiveField(4)
  final String image_1;
  @HiveField(5)
  final String image_2;
  @HiveField(6)
  final String image_3;
  @HiveField(7)
  final String description_1;
  @HiveField(8)
  final String description_2;
  @HiveField(9)
  final String description_3;

  TypesAndFeaturesModel({
    this.id,
    required this.name,
    required this.image,
    required this.subtitle,
    required this.image_1,
    required this.image_2,
    required this.image_3,
    required this.description_1,
    required this.description_2,
    required this.description_3,
  });

  factory TypesAndFeaturesModel.fromJson(Map<String, dynamic> json) {
    return TypesAndFeaturesModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      subtitle: json['subtitle'],
      image_1: json['image_1'],
      image_2: json['image_2'],
      image_3: json['image_3'],
      description_1: json['description_1'],
      description_2: json['description_2'],
      description_3: json['description_3'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'subtitle': subtitle,
      'image_1': image_1,
      'image_2': image_2,
      'image_3': image_3,
      'description_1': description_1,
      'description_2': description_2,
      'description_3': description_3,
    };
  }

  TypesAndFeaturesModel copyWith({
    int? id,
    String? name,
    String? image,
    String? subtitle,
    String? image_1,
    String? image_2,
    String? image_3,
    String? description_1,
    String? description_2,
    String? description_3,
  }) {
    return TypesAndFeaturesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      subtitle: subtitle ?? this.subtitle,
      image_1: image_1 ?? this.image_1,
      image_2: image_2 ?? this.image_2,
      image_3: image_3 ?? this.image_3,
      description_1: description_1 ?? this.description_1,
      description_2: description_2 ?? this.description_2,
      description_3: description_3 ?? this.description_3,
    );
  }
}
