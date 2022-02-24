import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/main_views/account_method.dart';
import 'package:flutter_application_1/pages/main_views/password_reset_screen.dart';
import 'package:flutter_application_1/widgets/text_h1.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String errorMessage = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String uid;
  late Stream<DocumentSnapshot<Map<String, dynamic>>> db;

  @override
  void initState() {
    super.initState();
    uid = _auth.currentUser!.uid;
    db = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('Profile')
        .doc('Personal details')
        .snapshots();
  }

  var boldFont = TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   titleSpacing: 30,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Color.fromRGBO(1, 67, 55, 1),
      //   title: new Text(
      //     'Settings',
      //     style: TextStyle(
      //         color: Color.fromRGBO(255, 255, 255, 1),
      //         fontFamily: 'Poppins',
      //         fontSize: 25,
      //         letterSpacing: 1.2,
      //         fontWeight: FontWeight.bold,
      //         height: 1),
      //   ),
      // ),
      body: Stack(
        children: [
          Image.asset("assets/images/notification_wave_bg.png",
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.cover),
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 20.0, right: 20, top: 100),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter'))),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            // _settingsListItem(
                            //     'First name',
                            //     StreamBuilder<DocumentSnapshot>(
                            //       stream: db,
                            //       // stream: db,
                            //       builder: (BuildContext context,
                            //           AsyncSnapshot<DocumentSnapshot>
                            //               snapshot) {
                            //         if (snapshot.hasError)
                            //           return Text('Something went wrong');
                            //         if (snapshot.connectionState ==
                            //             ConnectionState.waiting)
                            //           return CircularProgressIndicator();

                            //         dynamic data = snapshot.data!.data();
                            //         return Text(data['First name'] ?? "",
                            //             style: boldFont);
                            //       },
                            //     ),
                            //     action: () => {}),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            // _settingsListItem(
                            //     'Last name',
                            //     StreamBuilder<DocumentSnapshot>(
                            //       stream: db,
                            //       // stream: db,
                            //       builder: (BuildContext context,
                            //           AsyncSnapshot<DocumentSnapshot>
                            //               snapshot) {
                            //         if (snapshot.hasError)
                            //           return Text('Something went wrong');
                            //         if (snapshot.connectionState ==
                            //             ConnectionState.waiting)
                            //           return CircularProgressIndicator();

                            //         dynamic data = snapshot.data!.data();
                            //         return Text(data['Last name'] ?? "",
                            //             style: boldFont);
                            //       },
                            //     ),
                            //     action: () => {}),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            // _settingsListItem(
                            //   "Change password",
                            //   Icon(Icons.arrow_forward,
                            //       size: 18, color: Colors.black),
                            //   action: () => Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => PasswordResetScreen(),
                            //       )),
                            // ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            // _settingsListItem(
                            //     'Accounts',
                            //     Icon(
                            //       Icons.arrow_forward,
                            //       color: Colors.black,
                            //       size: 19.0,
                            //     ),
                            //     action: () => Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (context) =>
                            //                   AccountMethod()),
                            //         )),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            // _settingsListItem("Phone number",
                            //     Text("076058834", style: boldFont)),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            // _settingsListItem(
                            //     "Status", Text("Verified", style: boldFont)),
                            // SizedBox(height: 30),
                            InkWell(
                                onTap: () async {},
                                child: Text("Terms and Conditions",
                                    style: boldFont.copyWith(fontSize: 18))),
                            SizedBox(height: 20),
                            InkWell(
                                onTap: () async {
                                  try {
                                    await FirebaseAuth.instance.signOut();
                                    errorMessage = '';
                                  } on FirebaseAuthException catch (error) {
                                    errorMessage = error.message!;
                                  }
                                  Navigator.of(context)
                                      .pushReplacementNamed('/signIn');
                                  setState(() {});
                                },
                                child: Text("Sign out",
                                    style: boldFont.copyWith(fontSize: 18))),
                            // ElevatedButton(
                            //     // style: ButtonStyle(
                            //     //   backgroundColor: MaterialStateProperty.all(
                            //     //       Color.fromRGBO(1, 67, 55, 1)),
                            //     //   shape: MaterialStateProperty.all<
                            //     //           RoundedRectangleBorder>(
                            //     //       RoundedRectangleBorder(
                            //     //           borderRadius:
                            //     //               BorderRadius.circular(20))),
                            //     // ),
                            //     child: Text('Log out'),
                            //     onPressed: () async {
                            //       try {
                            //         await FirebaseAuth.instance.signOut();
                            //         errorMessage = '';
                            //       } on FirebaseAuthException catch (error) {
                            //         errorMessage = error.message!;
                            //       }
                            //       Navigator.of(context)
                            //           .pushReplacementNamed('/signIn');
                            //       setState(() {});
                            //     }),
                            SizedBox(height: 20),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ),
          Positioned(top: 50, left: 20, child: TextH1(title: "Settings"))
        ],
      ),
    );
  }

  Widget _settingsListItem(title, Widget trailing, {action}) {
    return Column(
      children: [
        InkWell(
          onTap: () => action(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), SizedBox(width: 40), trailing],
          ),
        ),
        Divider(color: Colors.black)
      ],
    );
  }
}
