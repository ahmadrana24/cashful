import 'package:flutter_application_1/configs/firebase_helper.dart';
import 'package:flutter_application_1/models/loan_request_model.dart';
import 'package:flutter_application_1/repositories/loan_request_repo.dart';
import 'package:flutter_application_1/view_models/base_view_model.dart';

class LoanRequestViewModel extends BaseViewModel {
  LoanRequestRepository _loanRequestRepository;
  FirebaseHelper _firebaseHelper;
  LoanRequestViewModel(this._loanRequestRepository, this._firebaseHelper);

  Future<bool> requestLoan(LoanRequest loanRequest) async {
    try {
      setState(ViewState.Busy);
      loanRequest.userId = _firebaseHelper.getUserId()!;
      loanRequest.loanDate = DateTime.now().toString();
      var value = await _loanRequestRepository.createLoanRequest(loanRequest);
      return value;
    } catch (e) {
      return false;
    } finally {
      setState(ViewState.Idle);
    }
  }
}
