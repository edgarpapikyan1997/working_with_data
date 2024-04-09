import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/user_model/user_model.dart';


Future<UserModel> fetchUserData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
  if (response.statusCode == 200) {
    // print(response.body);
    return UserModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }else {
    throw Exception("Failed to fetch a user");
  }
}


