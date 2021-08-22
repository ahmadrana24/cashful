import 'package:flutter/material.dart';

class ApplyForSME4 extends StatefulWidget {
  const ApplyForSME4({Key? key}) : super(key: key);

  @override
  _ApplyForSME3State createState() => _ApplyForSME3State();
}

class _ApplyForSME3State extends State<ApplyForSME4> {
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
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                          'Are you applying for a personal or business loan?',
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
                      'Personal',
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
                    Text('Business', style: myFont)
                  ]),
                  SizedBox(height: 10),
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                          'Please state the purpose of the loan in as much detail as possible',
                          style: myFont)),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 250,
                  ),
                  TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(5),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )),
                  ),
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.only(right: 32),
                      child: Text('How much are you looking to borrow?',
                          style: myFont)),
                  SizedBox(height: 10),
                  TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        isDense: true,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 75), child: Text('5/5')),
                Container(
                  margin: EdgeInsets.only(right: 40),
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(1, 67, 55, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            AlertDialog dialog = AlertDialog(
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                content:
                                Container(height: 200, width: 200,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                'assets/images/mail.png')),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Submitted',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey)),
                                        SizedBox(height: 15),
                                        Text('Application pending',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                        SizedBox(height: 15),
                                        Text(
                                            "We'll notify you of your status within the next 24 hours",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black)),
                                      ]),
                                ),
                                actions: [
                                  Container(alignment: Alignment.center,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromRGBO(1, 67, 55, 1)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20))),
                                        ),
                                        child: Text('Finish'),
                                        onPressed: () {
                                          Navigator.of(context).popUntil((route) => route.isFirst);

                                        }),
                                  )
                                ]);
                            return dialog;
                          })),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
