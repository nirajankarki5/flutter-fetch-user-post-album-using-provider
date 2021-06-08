import '../providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/post_container.dart';

class UsersPost extends StatefulWidget {
  int id;
  UsersPost(this.id);
  @override
  _UsersPostState createState() => _UsersPostState();
}

class _UsersPostState extends State<UsersPost> {
  bool _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    // like initstate but runs multiple times
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<PostProvider>(context).fetchPost(widget.id).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<PostProvider>(context);
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: post.postList.length,
            itemBuilder: (context, int index) {
              return PostContainer(post.postList[index]);
            });
  }
}
