import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_application_1/registration/verification.dart';
import 'package:image_picker/image_picker.dart';

class GetStartedPage extends StatefulWidget {
  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController address = TextEditingController();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(1, 67, 55, 1),
            toolbarHeight: 100,
            centerTitle: true,
            title: new Text(
              'Get started',
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
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: firstName,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        TextField(
                          controller: lastName,
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        TextField(
                          controller: dateOfBirth,
                          decoration: InputDecoration(
                            labelText: 'Date of birth',
                            hintText: 'dd/mm/yyyy',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        TextField(
                          controller: gender,
                          decoration: InputDecoration(
                            labelText: 'Gender',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        TextField(
                          controller: id,
                          decoration: InputDecoration(
                            labelText: 'ID number',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        TextField(
                          controller: address,
                          decoration: InputDecoration(
                            labelText: 'Address',
                            hintText: '102 Arnd St, Bloemfontein, Free State',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.camera),
                            label: Text('Upload'))
                      ],
                    ),
                  )),
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
              await collectionReference.add({
                'First name': firstName.text,
                'Last name': lastName.text,
                'Gender': gender.text,
                'Date of birth': dateOfBirth.text,
                'ID': id.text,
                'Address': address.text,
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerificationPage()),
              );
            },
          )),
    );
  }
}
