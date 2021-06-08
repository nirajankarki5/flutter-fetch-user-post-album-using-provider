import '../screens/my_tab_bar.dart';
import 'package:flutter/material.dart';

class UserContainer extends StatelessWidget {
  var user;
  UserContainer(this.user);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyTabBar(id: user.id, name: user.name)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _userName(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Divider(
                  thickness: 1,
                ),
              ),
              _userBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userName() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffa7a7d1),
          ),
          child: Icon(
            Icons.account_circle_outlined,
            size: 50,
          ),
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user.username,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _userBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.place,
                    size: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Lives in ${user.address.street}, ${user.address.city}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.work,
                    size: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Works at ${user.company.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
