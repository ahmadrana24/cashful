import 'package:flutter_application_1/configs/firebase_helper.dart';
import 'package:flutter_application_1/models/loan_request_model.dart';
import 'package:flutter_application_1/repositories/loan_request_repo.dart';
import 'package:flutter_application_1/view_models/base_view_model.dart';

class StatusViewModel extends BaseViewModel {
  LoanRequestRepository _loanRequestRepository;
  LoanRequest? _loanRequest;
  FirebaseHelper _firebaseHelper;
  StatusViewModel(this._loanRequestRepository, this._firebaseHelper);

  get loanRequest => _loanRequest;
  Future<bool> getUserLoan() async {
    try {
      setState(ViewState.Busy);
      var result = await _loanRequestRepository
          .getUserLoan(_firebaseHelper.getUserId()!);
      _loanRequest = result;
      setState(ViewState.Idle);

      return true;
    } catch (e) {
      return false;
    }
  }
}
