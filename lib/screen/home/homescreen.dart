import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookstore/screen/home/item_card.dart';
// import 'package:bookstore/screen/home/body.dart';
import 'package:bookstore/screen/home/bottomnav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference books = firestore.collection('books');

    Size size = MediaQuery.of(context).size;

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
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: size.height * 0.2 + 10,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: size.height * 0.2 - 27,
                      decoration: BoxDecoration(
                        color: WarnaPrimary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                        height: size.height * 0.2 - 57,
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/img/BookStore.png",
                          width: 800.0,
                        )),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                  bottom: defaultpadding,
                  left: defaultpadding,
                  right: defaultpadding,
                  top: defaultpadding / 10,
                ),
                child: Text(
                  'List Book',
                  style: GoogleFonts.roboto(
                    color: WarnaPrimary,
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //// FUTURE
              // FutureBuilder<QuerySnapshot>(
              //     future: books.get(),
              //     builder: (_, snapshot) {
              //       if (snapshot.hasData) {
              //         return Column(
              //           children: snapshot.data.docs
              //               .map((e) => ItemCard(e.data()['title'],
              //                   e.data()['description'], e.data()['price']))
              //               .toList(),
              //         );
              //       } else {
              //         return Text('Loading');
              //       }
              //     }),
              //// STREAM
              StreamBuilder<QuerySnapshot>(
                  stream: books.snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data.docs
                            .map((e) => ItemCard(
                                  e.data()['title'],
                                  e.data()['description'],
                                  e.data()['price'],
                                  onDelete: () {
                                    books.doc(e.id).delete();
                                  },
                                ))
                            .toList(),
                      );
                    } else {
                      return Text('Loading');
                    }
                  }),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
