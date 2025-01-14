import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name: 'userId')
  final int userID;
  final int id;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.userID,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
