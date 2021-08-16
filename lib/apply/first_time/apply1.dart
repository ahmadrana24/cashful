import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/apply/first_time/for_rest/for_rest1.dart';

import 'for_sme/for_sme1.dart';

class ApplyScreen1 extends StatefulWidget {
  const ApplyScreen1({Key? key}) : super(key: key);

  @override
  _ApplyScreen1State createState() => _ApplyScreen1State();
}

class _ApplyScreen1State extends State<ApplyScreen1> {
  int _value = 0;
  int _value2 = 0;
  var myFont = (TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.bold));
  bool _isVisible = true;
  bool _forBusiness = true;

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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40, bottom: 40),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 100),
                      child:
                          Text('Do you have a credit score?', style: myFont)),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(children: [
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
                        'Yes',
                        style: myFont,
                      )
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(children: [
                      Radio(
                          activeColor: Colors.black,
                          value: 2,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = (value) as int;
                              _isVisible = !_isVisible;
                            });
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      Text('No', style: myFont)
                    ]),
                  ),
                  SizedBox(height: 10),
                  Container(
                      margin: EdgeInsets.only(right: 112),
                      child: Visibility(
                          visible: _isVisible,
                          child: Text('What is your credit score?',
                              style: myFont))),
                  SizedBox(width: 4),
                  SizedBox(
                    width: 250,
                    child: Visibility(
                      visible: _isVisible,
                      child: TextField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.all(5),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                      margin: EdgeInsets.only(right: 60),
                      child: Text('Are you a small business owner?',
                          style: myFont)),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(children: [
                      Radio(
                        activeColor: Colors.black,
                        value: 3,
                        groupValue: _value2,
                        onChanged: (value) {
                          setState(() {
                            _value2 = (value) as int;
                            _forBusiness = _forBusiness;
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(children: [
                      Radio(
                          activeColor: Colors.black,
                          value: 4,
                          groupValue: _value2,
                          onChanged: (value) {
                            setState(() {
                              _value2 = (value) as int;
                              _forBusiness = !_forBusiness;
                            });
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      Text('No', style: myFont)
                    ]),
                  ),
                ],
              ),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 1,
          child: Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
          onPressed: () {
            if (_forBusiness) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ApplyForSME1()));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ApplyForRest1()));
            }
          }),
    );
  }
}
