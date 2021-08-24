import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class VerificationPage extends StatelessWidget {

  final idCard = TextEditingController();
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 67, 55, 1),
        toolbarHeight: 100,
        centerTitle: true,
        title: new Text(
          'Verification',
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Poppins',
              fontSize: 25,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              height: 1),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  'Upload your ID card for verification',
                  style: TextStyle(fontSize: 18),),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Uploading clear documents can make the approval process faster',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),
                constraints: BoxConstraints(
                    minHeight: 80, maxHeight: 100, maxWidth: 360, minWidth: 80),
                decoration: BoxDecoration(
                    color : Color.fromRGBO(254, 255, 224, 1),
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  'Please ensure all corners of your ID card are visible',
                  style: TextStyle(fontSize: 14),),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 1,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
            onPressed: () async {
              await collectionReference
              .add({
              
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerificationPage()),
              );
            },
          )
    );
  }
}
