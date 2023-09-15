import 'package:json_annotation/json_annotation.dart';

part 'trending_model.g.dart';

@JsonSerializable()
class SimpleModel {
  /// The generated code assumes these values exist in JSON.
  final String? title, url, body, mediaType, logo, timestamp;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final int? id;

  SimpleModel({
    required this.title,
    required this.body,
    this.id,
    this.url,
    this.mediaType = 'youtube',
    this.logo,
    this.timestamp = '1 hour ago',
  });

  /// Connect the generated [_$SimpleModelFromJson] function to the `fromJson`
  /// factory.
  factory SimpleModel.fromJson(Map<String, dynamic> json) =>
      _$SimpleModelFromJson(json);

  /// Connect the generated [_$SimpleModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SimpleModelToJson(this);
}
