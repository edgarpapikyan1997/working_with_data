import 'dart:convert';
import 'dart:io';

import 'package:working_with_data_project/models/posts_model/posts_model.dart';

import '../../models/post_models/post_model.dart';



class ApiClient {
  final client = HttpClient();

  Future<PostsModel> getPosts() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonString = await response.transform(utf8.decoder).toList();
    final jsonToString = jsonString.join();
    final dynamic json = jsonDecode(jsonToString);
    final posts = json.map((dynamic e) => Post.fromJson(e as Map<String, dynamic>)).toList();
    return posts;
  }
}
