import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/post_model.dart';

class PostProvider extends ChangeNotifier {
  List postList = [];
  Future<void> fetchPost(int userId) async {
    var url =
        Uri.parse("https://jsonplaceholder.typicode.com/users/$userId/posts");
    Response response = await get(url);

    List<PostModel> _tempList = [];
    List list = jsonDecode(response.body);
    for (var each in list) {
      _tempList.add(PostModel.fromJson(each));
    }
    postList = _tempList;
  }
}
