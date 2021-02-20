import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/screen/create/bodycreate.dart';
import 'package:bookstore/screen/home/homescreen.dart';
import 'package:bookstore/screen/create/bottomcreate.dart';

class CreateScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.home,
              color: Warnatext1,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            }),
      ),
      body: CreateBody(),
      bottomNavigationBar: BottomNavBarC(),
    );
  }
}
