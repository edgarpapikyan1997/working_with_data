// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pexels_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PexelsImageModel _$PexelsImageModelFromJson(Map<String, dynamic> json) =>
    PexelsImageModel(
      id: json['id'] as int?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      url: json['url'] as String?,
      photographer: json['photographer'] as String?,
      imageSource: ImageSource.fromJson(json['src'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PexelsImageModelToJson(PexelsImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'photographer': instance.photographer,
      'src': instance.imageSource,
    };
