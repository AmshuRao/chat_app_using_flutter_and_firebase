// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:chat_app_using_flutter_and_firebase/auth/auth_service.dart';
import 'package:chat_app_using_flutter_and_firebase/components/my_button.dart';
import 'package:chat_app_using_flutter_and_firebase/components/my_text_feild.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget { 
  LoginPage({super.key,required this.onTap});
  //login button function logic
  void login(BuildContext context)async{
    //Auth service instace
    AuthService authService = AuthService();
    try {
      await authService.signInWithEmailAndPassword(_emailController.text.toString(), _passwordControler.text.toString());
    }catch (e) {
        showDialog(
          context: context,
          builder: (context)=>AlertDialog(
            title: Text(e.toString()),
          )
        );
    }
  }

  //on tap
  final void Function()? onTap;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
           Icon(
              Icons.message,
              size: 60.0,
              color: Theme.of(context).colorScheme.primary,
            ),
            //welcome message
          const SizedBox(height: 20.0,),
          Text(
            "Welcome back ! hope ur doing well",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 50.0,),
            //email textfeild
            MyTextFeild(
              hintText: "Email", 
              controller: _emailController,
              isHide: false,
            ),
            const SizedBox(height: 10.0,),
        
            //password twxtfeild
          MyTextFeild(
              hintText: "Password", 
              controller: _passwordControler,
              isHide: true,
            ),
            //login button
          const SizedBox(height: 25.0,),
          MyButton(text:"login", onTap: ()=>login(context)),
            //register toggle
             const SizedBox(height: 25.0,),
            GestureDetector(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("not a member?",
                    style:TextStyle(
                      color: Theme.of(context).colorScheme.primary
                    )
                   ) ,
                    Text("Register now",
                    style:TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold
                    ) ,
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}