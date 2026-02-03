import 'package:cliniq/features/home/domain/entities/specialization_entity.dart';

class SpecializationModel extends SpecializationEntity {
  SpecializationModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory SpecializationModel.fromJson(Map<String, dynamic> json) {
    return SpecializationModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image};
  }

  factory SpecializationModel.fromEntity(SpecializationEntity entity) {
    return SpecializationModel(
      id: entity.id,
      name: entity.name,
      image: entity.image,
    );
  }

  toEntity() {
    return SpecializationEntity(id: id, name: name, image: image);
  }

  SpecializationModel copyWith({String? id, String? name, String? image}) {
    return SpecializationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
