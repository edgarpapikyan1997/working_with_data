import 'package:json_annotation/json_annotation.dart';

part 'image_sourse_model.g.dart';

@JsonSerializable()
class ImageSource {
  final String? original;
  final String? large;
  final String? medium;
  final String? small;

  const ImageSource(
      {required this.original, this.large, this.medium, this.small});

  factory ImageSource.fromJson(Map<String, dynamic> json) =>
      _$ImageSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ImageSourceToJson(this);
}
