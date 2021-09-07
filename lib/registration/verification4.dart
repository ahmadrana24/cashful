import 'package:flutter/material.dart';
import 'package:flutter_application_1/main_views/paymtn.dart';
import 'package:flutter_application_1/main_views/paystdbank.dart';

class VerificationPage4 extends StatefulWidget {
  const VerificationPage4({Key? key}) : super(key: key);

  @override
  _VerificationPage4State createState() => _VerificationPage4State();
}

class _VerificationPage4State extends State<VerificationPage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 67, 55, 1),
        toolbarHeight: 100,
        centerTitle: true,
        title: new Text(
          'Payment',
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
        child: Column(children: [
          SizedBox(height: 20),
          Text('Setup an account to which funds will be deposited and paid',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PayMtn()));
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  child: Image(image: AssetImage('assets/images/mtn.png'))),
              SizedBox(
                width: 25,
              ),
              Container(child: Text('MTN Mobile Money'))
            ]),
          ),
          SizedBox(height: 40),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PayStdBank()));
            },
            child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 88),
                      child: Image(
                          image: AssetImage('assets/images/stdbank.png'))),
                  SizedBox(
                    width: 35,
                  ),
                  Container(child: Text('EFT Transfer')),
                ]),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
              'Please ensure you only add a South African account that is in your own name',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
            child: Text('Submit',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins')),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ]),
      )),
    );
  }
}
