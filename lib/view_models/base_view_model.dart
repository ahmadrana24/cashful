import 'package:flutter/cupertino.dart';

enum ViewState { Idle, Busy }

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => this._state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
