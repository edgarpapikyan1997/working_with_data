// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_sourse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageSource _$ImageSourceFromJson(Map<String, dynamic> json) => ImageSource(
      original: json['original'] as String?,
      large: json['large'] as String?,
      medium: json['medium'] as String?,
      small: json['small'] as String?,
    );

Map<String, dynamic> _$ImageSourceToJson(ImageSource instance) =>
    <String, dynamic>{
      'original': instance.original,
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
    };
