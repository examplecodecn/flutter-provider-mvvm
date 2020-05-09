import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/views/base_view.dart';
import 'package:flutter_provider_mvvm/view_state.dart';
import 'package:flutter_provider_mvvm/viewmodels/home_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) async {
        model.loadData();
      },
      model: HomeViewModel(api: Provider.of(context)),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Color(0xFFF5F5F5),
          appBar: AppBar(
            title: Text('首页'),
          ),
          body: _buildBody(context, model),
      ),
    );
  }

  Widget _buildBody(BuildContext context, HomeViewModel model) {
    return Container(
        child: model.state == ViewState.Busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Text('APP首页'),
              ));
  }
}
