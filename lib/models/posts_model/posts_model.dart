import 'package:flutter/cupertino.dart';

import '../post_models/post_model.dart';

class PostsModel {
  var _posts = <Post>[];
  List<Post> get posts => _posts;

}