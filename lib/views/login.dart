import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/views/base_view.dart';
import 'package:flutter_provider_mvvm/models/user.dart';
import 'package:flutter_provider_mvvm/route_paths.dart';
import 'package:flutter_provider_mvvm/viewmodels/login_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final mobileTextController = TextEditingController();
  final smsTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      model: LoginViewModel(api: Provider.of(context)),
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Color(0xFFF5F5F5),
          appBar: AppBar(
            title: Text('登录/注册'),
          ),
          body: _buildLoginContent(context, model),
        );
      },
    );
  }

  Widget _buildLoginContent(BuildContext context, LoginViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTitle(context, model),
            SizedBox(height: 30),
            _buildSignArea(context, model),
            SizedBox(height: 50),
            _buildLoginBtn(context, model),
            SizedBox(height: 16),
          ],
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context, LoginViewModel model) {
    return Column(
      children: <Widget>[
        Text(
          '用户登录',
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Flutter MVVM 登录',
        )
      ],
    );
  }

  Widget _buildSignArea(BuildContext context, LoginViewModel model) {
    return Container(
      width: 270,
      child: Column(
        children: <Widget>[
          _buildMobile(context, model),
          Container(
            height: 0.5,
            color: Color(0xFF6a6a6a),
          ),
          _buildSMS(context, model),
          Container(
            height: 0.5,
            color: Color(0xFF6a6a6a),
          ),
        ],
      ),
    );
  }

  Widget _buildMobile(BuildContext context, LoginViewModel model) {
    return TextField(
      keyboardAppearance: Brightness.light,
      keyboardType: TextInputType.number,
      controller: mobileTextController,
      maxLength: 11,
      style: TextStyle(
        fontSize: 14,
        color: Color(0xFF191919),
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        counterText: '',
        hintText: '请输入手机号',
        hintStyle: TextStyle(
          fontSize: 14,
          color: Color(0xFFa5a5a5),
        ),
      ),
    );
  }

  Widget _buildSMS(BuildContext context, LoginViewModel model) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            controller: smsTextController,
            maxLength: 4,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF191919),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              counterText: '',
              hintText: '请输入短信验证码',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Color(0xFFa5a5a5),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (model.countdownTime == 0) {
              await model.sendSms(mobileTextController.text);
              model.startCountdown();
            }
          },
          child: Text(
            model.countdownTime > 0
                ? '${model.countdownTime}秒后重新发送'
                : '请输入短信验证码',
            style: TextStyle(
              fontSize: 14,
              color: model.countdownTime > 0
                  ? Color(0xFFa5a5a5)
                  : Color(0xFF191919),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildLoginBtn(BuildContext context, LoginViewModel model) {
    return ButtonTheme(
      minWidth: 270,
      height: 45,
      buttonColor: Color(0xFF08ba07),
      child: RaisedButton(
        onPressed: () async {
          if (await model.login(
              mobileTextController.text, smsTextController.text)) {
            Navigator.of(context).pushNamed(RoutePaths.HOME);
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Text(
          '登录',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
