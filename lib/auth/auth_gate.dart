import 'package:chat_app_using_flutter_and_firebase/auth/login_or_register_toggle_page.dart';
import 'package:chat_app_using_flutter_and_firebase/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //if user is loggd in
          if(snapshot.hasData)
          {
            return const HomePage();
          }
          else
          {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}