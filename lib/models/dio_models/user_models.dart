import 'package:json_annotation/json_annotation.dart';

part 'user_models.g.dart';

@JsonSerializable()
class UserDioModel {
  final int? id;
  final String? name;
  final String? username;

  const UserDioModel(
      {required this.id, required this.name, required this.username});

  factory UserDioModel.fromJson(Map<String, dynamic> json) =>
      _$UserDioModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDioModelToJson(this);
}
