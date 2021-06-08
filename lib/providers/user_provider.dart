import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/user_model.dart';
import 'package:http/http.dart';

class UserProvider extends ChangeNotifier {
  List userList = [];
  Future<void> fetchUsers() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    Response response = await get(url);

    List<UserModel> _tempList = [];
    List list = jsonDecode(response.body);
    for (var each in list) {
      _tempList.add(UserModel.fromJson(each));
    }
    userList = _tempList;
  }
}
