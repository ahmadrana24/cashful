import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/configs/size_const.dart';
import 'package:flutter_application_1/pages/main_views/home_with_bottom_navbar.dart';
import 'package:flutter_application_1/pages/registration/add_bank_account.dart';
import 'package:flutter_application_1/widgets/text_h1.dart';

class VerificationPage4 extends StatefulWidget {
  static const pageName = "/verificationPage4";

  const VerificationPage4({Key? key}) : super(key: key);

  @override
  _VerificationPage4State createState() => _VerificationPage4State();
}

FirebaseAuth _auth = FirebaseAuth.instance;
final uid = _auth.currentUser!.uid;

class _VerificationPage4State extends State<VerificationPage4> {
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController registeredNames = TextEditingController();
  var _paymentMethodAdded = false;

  void uploadMTNAccountDetails() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('Profile')
        .doc('MTN account details')
        .set({
      'Savings p/m': registeredNames.text,
      'Stokvel participation?': mobileNumber.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromRGBO(1, 67, 55, 1),
      //   centerTitle: true,
      //   title: new Text(
      //     'Payment',
      //     style: TextStyle(
      //         color: Color.fromRGBO(255, 255, 255, 1),
      //         fontFamily: 'Poppins',
      //         fontSize: 25,
      //         letterSpacing: 1.2,
      //         fontWeight: FontWeight.bold,
      //         height: 1),
      //   ),
      // ),
      backgroundColor: kPrimaryBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextH1(title: "Payment"),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0))),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Setup an account to which funds will be deposited and paid',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        AlertDialog dialog = AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            content: Container(
                                              height: 200,
                                              width: 200,
                                              child: Form(
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text('Add MTN account',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black)),
                                                      SizedBox(height: 15),
                                                      TextField(
                                                        controller:
                                                            registeredNames,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Registered Names',
                                                          border:
                                                              UnderlineInputBorder(),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextField(
                                                        controller:
                                                            mobileNumber,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Mobile Number',
                                                          border:
                                                              UnderlineInputBorder(),
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                            actions: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color
                                                                  .fromRGBO(
                                                                      1,
                                                                      67,
                                                                      55,
                                                                      1)),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                    ),
                                                    child: Text('Finish'),
                                                    onPressed: () async {
                                                      uploadMTNAccountDetails();
                                                      Navigator.pop(context);
                                                      _paymentMethodAdded =
                                                          true;
                                                    }),
                                              )
                                            ]);
                                        return dialog;
                                      });
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          child: Image(
                                              image: AssetImage(
                                                  'assets/images/mtn.png'))),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Container(child: Text('MTN Mobile Money'))
                                    ]),
                              ),
                              SizedBox(height: 30),
                              InkWell(
                                onTap: () async {
                                  var result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddBankAccountScreen()));

                                  if (result != null &&
                                      result == "Data Added") {
                                    _paymentMethodAdded = true;
                                  }
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Image(
                                              image: AssetImage(
                                                  'assets/images/stdbank.png'))),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(child: Text('EFT Transfer')),
                                    ]),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                          'Please ensure you only add a South African account that is in your own name',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(height: 20),
                      // Text('Add at least one account',
                      //     textAlign: TextAlign.center,
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 14,
                      //         color: Colors.red)),
                      SizedBox(height: 40),
                      SizedBox(
                        width: kScreenWidth(context) * 0.8,
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kPrimaryBlue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100))),
                            ),
                            child: Text('Complete registration'),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, HomeWithBottomNavBar.pageName);
                              return;
                              if (!_paymentMethodAdded) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      Text("Please add at least one account."),
                                ));
                              } else
                                Navigator.of(context)
                                    .pushReplacementNamed('/home');
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
