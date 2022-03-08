import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/apply/apply_steps_common.dart';
import 'package:flutter_application_1/widgets/text_h1.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return ApplyStepsCommon(
      bgImgUrl: "assets/images/notification_wave_bg.png",
      internalWidget: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextH1(title: "Help"),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Container(
                        child: Text("Have a question? We're here to help",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () async {
                        await launch("https://www.whatsup.com");
                      },
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 30),
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/whatsapp.png'))),
                            SizedBox(width: 20),
                            Container(child: Text('Whatsapp support'))
                          ]),
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: () async {
                        await launch('http://www.cashful.me/');
                      },
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 30),
                                child: Image(
                                    image:
                                        AssetImage('assets/images/globe.png'))),
                            SizedBox(
                              width: 20,
                            ),
                            Container(child: Text('Frequently asked questions'))
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Container(
                    child: Text(
                  'Follow us on social media',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () async {
                      await launch('http://www.facebook.com/cashful.me');
                    },
                    child:
                        Image(image: AssetImage('assets/images/facebook.png'))),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                    onTap: () async {
                      await launch('http://www.linkedin.com/company/cashful');
                    },
                    child:
                        Image(image: AssetImage('assets/images/linkedin.png')))
              ],
            )
          ],
        ),
      ),
    );
  }
}
