import '../screens/users_album.dart';
import '../providers/album_provider.dart';
import '../providers/post_provider.dart';
import 'package:provider/provider.dart';
import '../screens/users_post.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  int id;
  String name;

  MyTabBar({
    required this.id,
    required this.name,
  });

  // static const routeName = "/my-tab-bar";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff474787),
            ),
          ),
          title: Text(
            name,
            style: TextStyle(
              color: Color(0xff474787),
              fontSize: 23,
            ),
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Color(0xff474787),
            ),
            tabs: [
              Tab(
                text: "Posts",
              ),
              Tab(
                text: "Albums",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChangeNotifierProvider<PostProvider>(
              create: (context) => PostProvider(),
              child: UsersPost(id),
            ),
            ChangeNotifierProvider<AlbumProvider>(
              create: (context) => AlbumProvider(),
              child: UsersAlbum(id),
            ),
          ],
        ),
      ),
    );
  }
}
