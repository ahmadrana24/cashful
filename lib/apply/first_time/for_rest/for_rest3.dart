import 'package:flutter/material.dart';

import 'for_rest4.dart';


class ApplyForRest3 extends StatefulWidget {
  const ApplyForRest3({Key? key}) : super(key: key);

  @override
  _ApplyForRest3State createState() => _ApplyForRest3State();
}

class _ApplyForRest3State extends State<ApplyForRest3> {
  int _value = 0;
  int _value2 = 0;
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
                      child: Text('What is your highest level of education?',
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
                      'Postgraduate',
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
                    Text('Undergratuate', style: myFont)
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
                      'Matric',
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
                      'Elementary',
                      style: myFont,
                    )
                  ]),
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.only(right: 60),
                      child: Text('How much do you save per month?',
                          style: myFont)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Radio(
                      activeColor: Colors.black,
                      value: 1,
                      groupValue: _value2,
                      onChanged: (value) {
                        setState(() {
                          _value2 = (value) as int;
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
                        value: 2,
                        groupValue: _value2,
                        onChanged: (value) {
                          setState(() {
                            _value2 = (value) as int;
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
                        value: 3,
                        groupValue: _value2,
                        onChanged: (value) {
                          setState(() {
                            _value2 = (value) as int;
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    Text('R250 - R499', style: myFont)
                  ]),
                  Row(children: [
                    Radio(
                        activeColor: Colors.black,
                        value: 4,
                        groupValue: _value2,
                        onChanged: (value) {
                          setState(() {
                            _value2 = (value) as int;
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    Text('R500 and above', style: myFont)
                  ]),
                  Row(children: [
                    Radio(
                        activeColor: Colors.black,
                        value: 5,
                        groupValue: _value2,
                        onChanged: (value) {
                          setState(() {
                            _value2 = (value) as int;
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Not yet', style: myFont)
                  ]),
                  SizedBox(height: 10),
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
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ApplyForRest4()));
          }),
    );
  }
}
