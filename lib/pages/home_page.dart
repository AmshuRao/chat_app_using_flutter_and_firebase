import 'package:chat_app_using_flutter_and_firebase/auth/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void signOut()async{
    //instance of Authservice
    AuthService authService = AuthService();
    await authService.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("homepage"),
        actions: [
          //signout button
          IconButton(onPressed: signOut, icon:const  Icon(Icons.logout))
        ],
      ),
    );
  }
}