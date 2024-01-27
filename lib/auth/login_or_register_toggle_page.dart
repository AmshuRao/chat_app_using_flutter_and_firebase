import 'package:chat_app_using_flutter_and_firebase/pages/login_page.dart';
import 'package:chat_app_using_flutter_and_firebase/pages/register_page.dart';
import 'package:flutter/widgets.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool isLogin=true;

  void togglePage(){
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isLogin)
    {
      return LoginPage(onTap:togglePage);
    }
    else
    {
      return RegisterPage(onTap:togglePage);
    }
  }
}