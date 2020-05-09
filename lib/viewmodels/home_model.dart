import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_mvvm/api.dart';
import 'package:flutter_provider_mvvm/viewmodels/base_model.dart';
import 'package:flutter_provider_mvvm/view_state.dart';

class HomeViewModel extends BaseModel {

  HomeViewModel({@required Api api}) : super(api: api);

  Future<void> loadData() async {
    print('加载首页数据...');
    setState(ViewState.Busy);
    await Future.delayed(Duration(seconds: 2));
    setState(ViewState.Idle);
    print('加载首页数据完成');
  }

}