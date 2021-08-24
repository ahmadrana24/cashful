import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

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
            'Messages',
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Poppins',
                fontSize: 25,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
                height: 1),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromRGBO(246, 246, 246, 1),
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.all(40),
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Loan approved'),
                            SizedBox(width: 40),
                            Text('R700,00', style: boldFont)
                          ]),
                      Row(children: [Text('3 Apr 2020')]),
                      Divider(color: Colors.black),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Loan paid'),
                            SizedBox(width: 40),
                            Text('R550,00', style: boldFont)
                          ]),
                      Row(children: [Text('27 Mar 2020')]),
                      Divider(color: Colors.black),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Loan overdue'),
                          SizedBox(width: 40),
                          Text('R300', style: boldFont),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('3 Apr 2020'),
                            SizedBox(width: 40),
                            Text('+10% penalty fee')
                          ]),
                      Divider(color: Colors.black),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
