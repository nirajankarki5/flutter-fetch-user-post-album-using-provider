import '../providers/user_provider.dart';
import '../widgets/user_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  bool _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    // like initstate but runs multiple times
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<UserProvider>(context).fetchUsers().then((_) {
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
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users List",
          style: TextStyle(
            color: Color(0xff474787),
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: user.userList.length,
              itemBuilder: (context, int index) {
                // separate user container widget
                return UserContainer(user.userList[index]);
              },
            ),
    );
  }
}
