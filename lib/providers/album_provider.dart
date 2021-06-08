import 'dart:convert';

import '../models/album_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AlbumProvider extends ChangeNotifier {
  List albumList = [];
  Future<void> fetchAlbum(int userId) async {
    var url =
        Uri.parse("https://jsonplaceholder.typicode.com/users/$userId/albums");
    Response response = await get(url);

    List<AlbumModel> _tempList = [];
    List list = jsonDecode(response.body);
    for (var each in list) {
      _tempList.add(AlbumModel.fromJson(each));
    }
    albumList = _tempList;
  }
}
