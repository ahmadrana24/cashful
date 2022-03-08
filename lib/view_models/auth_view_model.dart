import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

enum AuthState { Idle, CodeSent, Failed, Success, Busy }

class AuthViewModel extends ChangeNotifier {
  late FirebaseAuth _auth;
  AuthState authState = AuthState.Idle;
  String? _verificationId;

  AuthViewModel() {
    _auth = FirebaseAuth.instance;
  }

  void sendOTP(String phoneNumber) async {
    authState = AuthState.Busy;
    notifyListeners();
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: _verificationCompleted,
        verificationFailed: _verificationFailed,
        codeSent: _codeSent,
        codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout);
  }

  void _verificationCompleted(PhoneAuthCredential credential) async {
    // automatically authenticate only for android
  }

  void _verificationFailed(FirebaseAuthException e) async {
    if (e.code == 'invalid-phone-number') {
      authState = AuthState.Failed;
      notifyListeners();
    }
    authState = AuthState.Failed;
    notifyListeners();
  }

  void _codeSent(String verificationId, int? resendToken) async {
    _verificationId = verificationId;
    authState = AuthState.CodeSent;
    notifyListeners();
  }

  void _codeAutoRetrievalTimeout(String verificationId) async {}

  void verifyOTP(String OTP) async {
    assert(_verificationId != null);
    print("Verifiying OTP");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: OTP);
    authState = AuthState.Busy;
    UserCredential _userCredential =
        await _auth.signInWithCredential(credential);
    _userCredential.user!.uid;
    authState = AuthState.Success;
    notifyListeners();
  }
}
