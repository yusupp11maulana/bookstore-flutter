import 'package:flutter/material.dart';
import 'package:bookstore/constants.dart';
import 'package:bookstore/screen/home/homescreen.dart';
import 'package:bookstore/screen/create/createscreen.dart';

class BottomNavBarC extends StatelessWidget {
  const BottomNavBarC({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: defaultpadding * 3,
        right: defaultpadding * 3,
      ),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: WarnaItem.withOpacity(0.30),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: WarnaPrimary,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
