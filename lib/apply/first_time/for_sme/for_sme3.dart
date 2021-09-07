import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'for_sme4.dart';

class ApplyForSME3 extends StatefulWidget {
  const ApplyForSME3({Key? key}) : super(key: key);

  @override
  _ApplyForSME3State createState() => _ApplyForSME3State();
}

class _ApplyForSME3State extends State<ApplyForSME3> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');

  String monthlySavings = '';
  String stokvelValue = '';
  final TextEditingController stokvelContribution = TextEditingController();
  String education = '';

  var myFont = (TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.bold));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 30,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(1, 67, 55, 1),
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
              margin: EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text('How much do you save per month?',
                          style: myFont)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Radio(
                      activeColor: Colors.black,
                      value: 'R1 - R99',
                      groupValue: monthlySavings,
                      onChanged: (value) {
                        setState(() {
                          monthlySavings = value as String;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'R1 - R99',
                      style: myFont,
                    )
                  ]),
                  Row(children: [
                    Radio(
                        activeColor: Colors.black,
                        value: 'R100 - R249',
                        groupValue: monthlySavings,
                        onChanged: (value) {
                          setState(() {
                            monthlySavings = value as String;
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    Text('R100 - R249', style: myFont)
                  ]),
                  Row(children: [
                    Radio(
                      activeColor: Colors.black,
                      value: 'R250 - R499',
                      groupValue: monthlySavings,
                      onChanged: (value) {
                        setState(() {
                          monthlySavings = value as String;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'R250 - R499',
                      style: myFont,
                    )
                  ]),
                  Row(children: [
                    Radio(
                      activeColor: Colors.black,
                      value: 'R500 and above',
                      groupValue: monthlySavings,
                      onChanged: (value) {
                        setState(() {
                          monthlySavings = value as String;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'R500 and above',
                      style: myFont,
                    )
                  ]),
                  Row(children: [
                    Radio(
                      activeColor: Colors.black,
                      value: 'Not yet',
                      groupValue: monthlySavings,
                      onChanged: (value) {
                        setState(() {
                          monthlySavings = value as String;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Not yet', style: myFont)
                  ]),
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.only(right: 60),
                      child: Text('Are you part of a stokvel group?',
                          style: myFont)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Radio(
                      activeColor: Colors.black,
                      value: 'Yes',
                      groupValue: stokvelValue,
                      onChanged: (value) {
                        setState(() {
                          stokvelValue = value as String;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Yes',
                      style: myFont,
                    )
                  ]),
                  Row(children: [
                    Radio(
                        activeColor: Colors.black,
                        value: 'No',
                        groupValue: stokvelValue,
                        onChanged: (value) {
                          setState(() {
                            stokvelValue = value as String;
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    Text('No', style: myFont)
                  ]),
                  SizedBox(height: 10),
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text('How much is contributed on a regular basis?',
                          style: myFont)),
                  SizedBox(width: 4),
                  SizedBox(
                    width: 250,
                  ),
                  TextField(
                    controller: stokvelContribution,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(5),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )),
                  ),
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text('What is your highest level of education?',
                          style: myFont)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Radio(
                      activeColor: Colors.black,
                      value: 'Postgraduate',
                      groupValue: education,
                      onChanged: (value) {
                        setState(() {
                          education = value as String;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Postgraduate',
                      style: myFont,
                    )
                  ]),
                  Row(children: [
                    Radio(
                        activeColor: Colors.black,
                        value: 'Undergraduate',
                        groupValue: education,
                        onChanged: (value) {
                          setState(() {
                            education = value as String;
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Undergratuate', style: myFont)
                  ]),
                  Row(children: [
                    Radio(
                      activeColor: Colors.black,
                      value: 'Matric',
                      groupValue: education,
                      onChanged: (value) {
                        setState(() {
                          education = value as String;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Matric',
                      style: myFont,
                    )
                  ]),
                  Row(children: [
                    Radio(
                      activeColor: Colors.black,
                      value: 'Elementary',
                      groupValue: education,
                      onChanged: (value) {
                        setState(() {
                          education = value as String;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Elementary',
                      style: myFont,
                    )
                  ]),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Container(alignment: Alignment.center, child: Text('4/5'))
          ],
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
                .doc(collectionReference.doc('Applicant particulars').id)
                .update({
              'map c': {
                'Savings p/m': monthlySavings,
                'Stokvel participation?': stokvelValue,
                'Stokvel contribution': stokvelContribution.text
              }
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ApplyForSME4()));
          }),
    );
  }
}
