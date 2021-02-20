import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Formlayout extends StatefulWidget {
  @override
  _FormlayoutStates createState() => _FormlayoutStates();
}

class _FormlayoutStates extends State<Formlayout> {
  String nama = "";
  String deskripsi = "";
  double harga = 0;
  var namaController = new TextEditingController();
  var descController = new TextEditingController();
  var hargaController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference books = firestore.collection('books');

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                alignment: Alignment.topLeft,
                child: TextField(
                  controller: namaController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
                    labelText: "Nama",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                width: 380,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                alignment: Alignment.topLeft,
                child: TextField(
                  controller: descController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
                    labelText: "Deskripsi",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                width: 380,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                alignment: Alignment.topLeft,
                child: TextField(
                  controller: hargaController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
                    labelText: "Harga",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                width: 380,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 20, top: 8),
                  child: RaisedButton(
                    color: WarnaPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    onPressed: () {
                      books.add({
                        'title': namaController.text,
                        'description': descController.text,
                        'price': int.tryParse(hargaController.text) ?? 0
                      });
                      namaController.text = '';
                      descController.text = '';
                      hargaController.text = '';
                    },
                    child: Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
