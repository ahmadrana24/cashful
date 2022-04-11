import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/configs/helper.dart';
import 'package:flutter_application_1/configs/locator.dart';
import 'package:flutter_application_1/configs/size_const.dart';
import 'package:flutter_application_1/models/loan_request_model.dart';
import 'package:flutter_application_1/pages/base_view.dart';
import 'package:flutter_application_1/pages/main_views/home_with_bottom_navbar.dart';
import 'package:flutter_application_1/view_models/base_view_model.dart';
import 'package:flutter_application_1/view_models/loan_request_view_model.dart';
import 'package:flutter_application_1/view_models/user_view_model.dart';
import 'package:flutter_application_1/widgets/text_h1.dart';
import 'package:provider/provider.dart';

class ApplyFinalStep extends StatefulWidget {
  static const pageName = "/applyFinalStep";
  final LoanRequest _loanRequest;
  ApplyFinalStep(this._loanRequest);
  @override
  State<ApplyFinalStep> createState() => _ApplyFinalStepState();
}

class _ApplyFinalStepState extends State<ApplyFinalStep> {
  var viewModel = locator<LoanRequestViewModel>();

  var _min = 0;
  var _max = 100;
  var _loanValue = 100.0;
  var _returnDateIndex = 0;
  // var _showSlider = false;

  var _paymentDays = [];
  var _interest = 0.15;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(builder: (context, userVM, child) {
      var user = userVM.user!;
      WidgetsBinding.instance!.addPostFrameCallback(
        (_) {
          setState(() {
            _paymentDays = user.level!.repayDates;
          });
        },
      );
      return BaseView<LoanRequestViewModel>(builder: (context, model, child) {
        return Scaffold(
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
                      // "You qualify for an advance maximum of up to R600, please move the slider to select an amount",
                      user.level!.name == 'level1'
                          ? "As a first time borrower, you qualify for an advance maximum of R100."
                          : "You qualify for an advance maximum of up to R${user.level!.max}, please move the slider to select an amount",
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
                    if (user.level!.min != user.level!.max)
                      Row(
                        children: [
                          Text(
                            "R${user.level!.min}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Slider(
                              min: user.level!.min.toDouble() /
                                  user.level!.max.toDouble(),
                              max: user.level!.max.toDouble() /
                                  user.level!.max.toDouble(),
                              divisions: 10,
                              value: _loanValue / user.level!.max.toDouble(),
                              onChanged: (value) {
                                setState(() {
                                  _loanValue = value * user.level!.max;
                                });
                              },
                              thumbColor: Colors.white,
                              inactiveColor: kBgLight,
                              activeColor: kPrimaryBlue,
                            ),
                          ),
                          Text(
                            "R${user.level!.max}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _paymentDays
                            .map<Widget>((
                              e,
                            ) =>
                                _daysWidget("$e days", _paymentDays.indexOf(e)))
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Interest",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "(${user.level!.interest * 100}%) R${(user.level!.interest * _loanValue).toStringAsFixed(2)}")
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
                        Text(
                            "R${(_loanValue + user.level!.interest * _loanValue).toStringAsFixed(2)}",
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
                            child: model.state == ViewState.Busy
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
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
          )),
        );
      });
    });
  }

  _daysWidget(String text, index) {
    bool active = index == _returnDateIndex;
    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: active ? kPrimaryBlue : Colors.white,
          border: Border.all(
              color: active ? kPrimaryBlue : Colors.black26, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          setState(() {
            _returnDateIndex = index;
          });
        },
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontSize: 14, color: active ? Colors.white : Colors.black)),
        ),
      ),
    );
  }

  _submit() async {
    widget._loanRequest.loanAmount = _loanValue.toStringAsFixed(2);
    widget._loanRequest.paymentTime = _paymentDays[_returnDateIndex].toString();
    widget._loanRequest.totalRepayable =
        (_loanValue + _loanValue * _interest).toStringAsFixed(2);
    var result = await viewModel.requestLoan(widget._loanRequest);
    if (result)
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
                  TextH4(title: "Request submitted", color: Colors.black),
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
                          Navigator.of(mContext).pop();
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    else
      AppHelper.showSnackBar("Something went wrong try again", context);
  }
}
