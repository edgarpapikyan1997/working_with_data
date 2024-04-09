class ImageModel {
  int id;
  Source source;

  ImageModel({required this.id, required this.source});

  factory ImageModel.fromJson(Map <String, dynamic> json) {
    return ImageModel(id: json["id"], source: Source.fromJson(json["src"]));
  }
}

class Source {
  String originalImage;

  Source({
    required this.originalImage,
  });

  factory Source.fromJson(Map <String, dynamic> json) {
    return Source(originalImage: json["original"]);
  }
}