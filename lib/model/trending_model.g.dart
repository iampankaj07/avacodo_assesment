// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleModel _$SimpleModelFromJson(Map<String, dynamic> json) => SimpleModel(
      title: json['title'] as String?,
      body: json['body'] as String?,
      id: json['id'] as int?,
      url: json['url'] as String?,
      mediaType: json['mediaType'] as String? ?? 'youtube',
      logo: json['logo'] as String?,
      timestamp: json['timestamp'] as String? ?? '1 hour ago',
    );

Map<String, dynamic> _$SimpleModelToJson(SimpleModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'body': instance.body,
      'mediaType': instance.mediaType,
      'logo': instance.logo,
      'timestamp': instance.timestamp,
      'id': instance.id,
    };
