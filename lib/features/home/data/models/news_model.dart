import 'package:cliniq/features/home/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  NewsModel({
    required super.id,
    required super.title,
    required super.image,
    required super.description,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'description': description,
    };
  }

  factory NewsModel.fromEntity(NewsEntity entity) {
    return NewsModel(
      id: entity.id,
      title: entity.title,
      image: entity.image,
      description: entity.description,
    );
  }

  toEntity() {
    return NewsEntity(
      id: id,
      title: title,
      image: image,
      description: description,
    );
  }

  NewsModel copyWith({
    String? id,
    String? title,
    String? image,
    String? description,
  }) {
    return NewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }
}
