import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var boldFont = TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600);


    return Scaffold(
        appBar: AppBar(
          titleSpacing: 30,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(1, 67, 55, 1),
          toolbarHeight: 100,
          title: new Text(
            'Settings',
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
          color: Color.fromRGBO(246, 246, 246, 1),
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(),
                child: Text('Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'))),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('First name'),
                        SizedBox(width: 40),
                        Text('Lorem', style: boldFont)
                      ]),
                  Divider(color: Colors.black),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Last name'),
                      SizedBox(width: 40),
                      Text('Ipsum', style: boldFont)
                    ],
                  ),
                  Divider(color: Colors.black),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Change password'),
                      SizedBox(width: 40),
                      Icon(Icons.arrow_forward, size: 18, color: Colors.black)
                    ],
                  ),
                  Divider(color: Colors.black),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Payment method'),
                      SizedBox(width: 40),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 19.0,
                        semanticLabel: 'EFT Transfer',
                      ),
                    ],
                  ),
                  Divider(color: Colors.black),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
