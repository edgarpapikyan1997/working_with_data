import 'package:json_annotation/json_annotation.dart';

import '../../image_model/image_model.dart';
import 'image_sourse_model.dart';

part 'pexels_image_model.g.dart';

@JsonSerializable()
class PexelsImageModel {
  final int? id;
  final int? width;
  final int? height;
  final String? url;
  final String? photographer;
  @JsonKey(name: 'src')
  final ImageSource imageSource;

  const PexelsImageModel({
    required this.id,
    this.width,
    this.height,
    required this.url,
    required this.photographer,
    required this.imageSource,
  });

  factory PexelsImageModel.fromJson(Map<String, dynamic> json) =>
      _$PexelsImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PexelsImageModelToJson(this);
}

/*
{
"id": 2014422,
"width": 3024,
"height": 3024,
"url": "https://www.pexels.com/photo/brown-rocks-during-golden-hour-2014422/",
"photographer": "Joey Farina",
"photographer_url": "https://www.pexels.com/@joey",
"photographer_id": 680589,
"avg_color": "#978E82",
"src": {
"original": "https://images.pexels.com/photos/2014422/pexels-photo-2014422.jpeg",
"large2x": "https://images.pexels.com/photos/2014422/pexels-photo-2014422.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
"large": "https://images.pexels.com/photos/2014422/pexels-photo-2014422.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
"medium": "https://images.pexels.com/photos/2014422/pexels-photo-2014422.jpeg?auto=compress&cs=tinysrgb&h=350",
"small": "https://images.pexels.com/photos/2014422/pexels-photo-2014422.jpeg?auto=compress&cs=tinysrgb&h=130",
"portrait": "https://images.pexels.com/photos/2014422/pexels-photo-2014422.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
"landscape": "https://images.pexels.com/photos/2014422/pexels-photo-2014422.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
"tiny": "https://images.pexels.com/photos/2014422/pexels-photo-2014422.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
},
"liked": false,
"alt": "Brown Rocks During Golden Hour"
}
*/
