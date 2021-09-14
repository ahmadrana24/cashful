import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  // final db = FirebaseFirestore.instance.collection('users').snapshots();
  final Stream<DocumentSnapshot<Map<String, dynamic>>> db = FirebaseFirestore
      .instance
      .collection('users')
      .doc('Outstanding loans')
      .collection('Loan details')
      .doc('NlwI7O7owxtyZtEZrN7O')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: 
      
      // StreamBuilder<DocumentSnapshot>(
      //   stream: db,
      //   builder:
      //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      //     if (snapshot.hasError) return Text('Something went wrong');
      //     if (snapshot.connectionState == ConnectionState.waiting)
      //       return CircularProgressIndicator();

      //     dynamic data = snapshot.data!.data();
      //   return Text(data['First name']);
      //   },
      // ),

      StreamBuilder<DocumentSnapshot>(
        stream: db,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) return Text('Something went wrong');
          if (snapshot.connectionState == ConnectionState.waiting)
            return CircularProgressIndicator();

          dynamic data = snapshot.data!.data();
        return Text(data['Amount due']);
        },
      ),
    );
  }
}
