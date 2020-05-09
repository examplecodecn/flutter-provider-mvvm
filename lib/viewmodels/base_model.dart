import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/api.dart';
import 'package:flutter_provider_mvvm/view_state.dart';

class BaseModel extends ChangeNotifier {

  Api api;
  bool disposed = false;

  BaseModel({@required Api api}) : api = api;

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }
}