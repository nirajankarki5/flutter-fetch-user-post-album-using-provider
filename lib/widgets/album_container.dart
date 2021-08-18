import 'package:flutter/material.dart';

class AlbumContainer extends StatelessWidget {
  var album;
  AlbumContainer(this.album);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        height: double.infinity,
        color: Color(0xffa7a7d1),
        child: Icon(
          Icons.collections,
          size: 40,
        ),
      ),
      footer: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black26,
        ),
        height: 60,
        child: Text(
          album.title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
