import 'package:dio/dio.dart';
import 'package:working_with_data_project/models/image_models/pexels_image_model.dart';

const imageAccessToken =
    "PSTP3mkIjnTUwG3m6tx7o99uVXXxd6lJ95IbyTwtFj8h0bNaMoo1aOWG";

final dioImageRetriever = Dio(
  BaseOptions(baseUrl: 'https://api.pexels.com/v1/', headers: {
    'Authorization': imageAccessToken,
  }),
);

// Response response = await dio.get('https://api.pexels.com/v1/photos/PHOTO_ID');

Future<PexelsImageModel> getRandomImage({int? randomNum}) async {
  try {
    final response = await dioImageRetriever.get('photos/$randomNum');
    print('Response is valid : ${response.data}');
    return PexelsImageModel.fromJson(response.data as Map<String, dynamic>);
  } catch (e) {
    throw Exception('Error: Responce is not valid $e');
  }
}

// Future<List<PexelsImageModel>> getListOfImages() async {
//   try {
//     final response = (await dioImageRetriever.get('curated/'));
//     if (response.statusCode == 200) {
//       List<dynamic> responseData = response.data;
//       List<PexelsImageModel> imageList = responseData
//           .map((imageData) =>
//               PexelsImageModel.fromJson(imageData as Map<String, dynamic>))
//           .toList();
//       return imageList;
//     } else {
//       throw Exception('Invalid Data: ${response.statusCode}');
//     }
//   } catch (e) {
//     throw Exception('$e');
//   }
// }
