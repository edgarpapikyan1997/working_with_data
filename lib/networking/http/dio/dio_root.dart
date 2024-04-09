import 'package:dio/dio.dart';

import '../../../models/dio_models/user_models.dart';


final dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

Future<UserDioModel> getTodo() async {
  try {
    final response = await dio.get('users/1');
    print(response);
    return UserDioModel.fromJson(response.data);
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<List<UserDioModel>> getListOfUsers() async {
  try {
    final response = await dio.get('users/');
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<UserDioModel> userList = responseData
          .map((userData) => UserDioModel.fromJson(userData))
          .toList();
      return userList;
    } else {
      throw Exception('Failed to load users: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load users: $e');
  }
}
