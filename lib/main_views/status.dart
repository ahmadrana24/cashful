import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    var boldFont = TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600);
    final Stream<DocumentSnapshot<Map<String, dynamic>>> db = FirebaseFirestore
        .instance
        .collection('users')
        .doc('Outstanding loans')
        .collection('Loan details')
        .doc('NlwI7O7owxtyZtEZrN7O')
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 30,
        automaticallyImplyLeading: true,
        backgroundColor: Color.fromRGBO(1, 67, 55, 1),
        toolbarHeight: 100,
        title: new Text(
          'Status',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 25,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              height: 1),
        ),
      ),
      body: SingleChildScrollView(
      child: Container(
          height: 450,
            width: 300,
            margin: EdgeInsets.all(40),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: Column(children: [
              SizedBox(height: 30),
              Container(
                  width: 200,
                  height: 200,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0, 4),
                                    blurRadius: 10)
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                              border: Border.all(
                                color: Color.fromRGBO(243, 243, 243, 1),
                                width: 7,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(200, 200)),
                            ))),
                    Positioned(
                      top: 92,
                      left: 30,
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: db,
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError)
                            return Text('Something went wrong');
                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return CircularProgressIndicator();

                          dynamic data = snapshot.data!.data();
                          return Text(
                            data['Amount due'],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color:
                                    Color.fromRGBO(0, 0, 0, 0.699999988079071),
                                fontFamily: 'Inter',
                                fontSize: 35,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          );
                        },
                      ),
                      // Text(
                      //   'R784.00',
                      //
                    ),
                    Positioned(
                        top: 65,
                        left: 36,
                        child: Text(
                          'Outstanding balance',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.699999988079071),
                              fontFamily: 'Inter',
                              fontSize: 13,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                      top: 144,
                      left: 68,
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: db,
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError)
                            return Text('Something went wrong');
                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return CircularProgressIndicator();

                          dynamic data = snapshot.data!.data();
                          return Text(
                            data['Due date'],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color:
                                    Color.fromRGBO(0, 0, 0, 0.699999988079071),
                                fontFamily: 'Inter',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          );
                        },
                      ),
                    ),
                  ])),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 29),
                child: Row(children: [Text('Loan details', style: boldFont)]),
              ),
              SizedBox(height: 15),
Column( 
  children:[ 
              Padding(
                padding:  EdgeInsets.only(right: 24),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Loan amount'),
                  SizedBox(width: 80),
                  StreamBuilder<DocumentSnapshot>(
                    stream: db,
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError)
                        return Text('Something went wrong');
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return CircularProgressIndicator();

                      dynamic data = snapshot.data!.data();
                      return Text(
                        data['Loan amount'],
                        style: boldFont,
                      );
                    },
                  ),
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:  EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text('Interest'),
                    SizedBox(width: 116),
                    StreamBuilder<DocumentSnapshot>(
                      stream: db,
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError)
                          return Text('Something went wrong');
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return CircularProgressIndicator();

                        dynamic data = snapshot.data!.data();
                        return Text(
                          data['Interest'],
                          style: boldFont,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:  EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text('Loan term'),
                    SizedBox(width: 100),
                    StreamBuilder<DocumentSnapshot>(
                      stream: db,
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError)
                          return Text('Something went wrong');
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return CircularProgressIndicator();

                        dynamic data = snapshot.data!.data();
                        return Text(
                          data['Loan term'],
                          style: boldFont,
                        );
                      },
                    ),
                  ],
                ),
              ),
]),
              SizedBox(
                height: 10,
              ),
            ])),
      ),
    );
  }
}
