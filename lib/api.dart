import 'package:flutter_provider_mvvm/models/user.dart';

class Api {
  /// 用户登录。简单起见，返回User
  Future<User> login(String mobile, String sms) async {
    print('登录中...');
    await Future.delayed(Duration(seconds: 2));
    User user = User(1, '程序员磊哥');
    print('登录成功: $user');
    return user;
  }
}
