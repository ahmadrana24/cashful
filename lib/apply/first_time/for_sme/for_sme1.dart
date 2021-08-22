import 'package:flutter/material.dart';

import 'for_sme2.dart';

class ApplyForSME1 extends StatefulWidget {
  const ApplyForSME1({Key? key}) : super(key: key);

  @override
  _ApplyForSME1State createState() => _ApplyForSME1State();
}

class _ApplyForSME1State extends State<ApplyForSME1> {
  int _value = 0;
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
                      margin: EdgeInsets.only(right: 40),
                      child: Text(
                          'What services/products does your business offer?',
                          style: myFont)),
                  SizedBox(width: 4),
                  SizedBox(
                    width: 250,
                  ),
                  TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(5),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )),
                  ),
                  SizedBox(height: 10),
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                          'How long has your business been operational?',
                          style: myFont)),
                  SizedBox(width: 4),
                  SizedBox(
                    width: 250,
                  ),
                  TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(5),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )),
                  ),
                  SizedBox(height: 10),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text('How did you finance your business?',
                          style: myFont)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Radio(
                      activeColor: Colors.black,
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = (value) as int;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Personal savings',
                      style: myFont,
                    )
                  ]),
                  Row(children: [
                    Radio(
                        activeColor: Colors.black,
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = (value) as int;
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Group savings / stokvel', style: myFont)
                  ]),
                  Row(children: [
                    Radio(
                      activeColor: Colors.black,
                      value: 3,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = (value) as int;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Friends/family',
                      style: myFont,
                    )
                  ]),
                  Row(children: [
                    Radio(
                      activeColor: Colors.black,
                      value: 4,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = (value) as int;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Bank loan',
                      style: myFont,
                    )
                  ]),
                  Row(children: [
                    Radio(
                      activeColor: Colors.black,
                      value: 5,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = (value) as int;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Other', style: myFont)
                  ]),
                ],
              ),
            ),
            Container(alignment: Alignment.center, child: Text('2/5'))
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
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ApplyForSME2()));
          }),
    );
  }
}
