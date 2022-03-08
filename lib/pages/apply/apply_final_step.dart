import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/configs/size_const.dart';
import 'package:flutter_application_1/widgets/text_h1.dart';

class ApplyFinalStep extends StatefulWidget {
  static const pageName = "/applyFinalStep";

  @override
  State<ApplyFinalStep> createState() => _ApplyFinalStepState();
}

class _ApplyFinalStepState extends State<ApplyFinalStep> {
  var _min = 0;
  var _max = 1000;
  var _loanValue = 0.0;
  var _returnDateIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBgLight,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextH1(
                  title: "Apply",
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(30.0),
                width: kScreenWidth(context),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextH3(
                      title: "Select loan amount",
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "You qualify for an advance maximum of up to R600, please move the slider to select an amount",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(width: 1, color: Colors.black26)),
                      child: TextH2(
                        title: "R${_loanValue.toStringAsFixed(0)}",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Text(
                          "R$_min",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Slider(
                            value: _loanValue / _max,
                            onChanged: (value) {
                              setState(() {
                                _loanValue = value * _max;
                              });
                            },
                            thumbColor: Colors.white,
                            inactiveColor: kBgLight,
                            activeColor: kPrimaryBlue,
                          ),
                        ),
                        Text(
                          "R$_max",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: [
                        _daysWidget("14 days", 1),
                        _daysWidget("21 days", 2),
                        _daysWidget("31 days", 3),
                        _daysWidget("45 days", 4)
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Interest",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("(12%) R72.00")
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total repayable",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Text("R672.00",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kPrimaryBlue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                            ),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                            onPressed: () {
                              _submit();
                            }),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ));
  }

  _daysWidget(String text, index) {
    bool active = index == _returnDateIndex;
    return InkWell(
      onTap: () {
        setState(() {
          _returnDateIndex = index;
        });
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            color: active ? kPrimaryBlue : Colors.white,
            border: Border.all(
                color: active ? kPrimaryBlue : Colors.black26, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontSize: 14, color: active ? Colors.white : Colors.black)),
        ),
      ),
    );
  }

  _submit() {
    showDialog(
      context: context,
      builder: (mContext) => AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          height: 390,
          padding: EdgeInsets.symmetric(vertical: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/apply_dialog_icon.png",
                  width: 80,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Request submitted",
                  style: TextStyle(color: Colors.black45),
                ),
                SizedBox(
                  height: 10,
                ),
                TextH4(title: "Your loan is on its way", color: Colors.black),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Please allow up to 48 hours depending on your payment method",
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Pay early or on time to unlock more credit in future",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryBlue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40))),
                      ),
                      child: Text(
                        'Finish',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(mContext).pop();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
