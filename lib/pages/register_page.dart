// ignore_for_file: use_build_context_synchronously

import 'package:chat_app_using_flutter_and_firebase/auth/auth_service.dart';
import 'package:chat_app_using_flutter_and_firebase/components/my_button.dart';
import 'package:chat_app_using_flutter_and_firebase/components/my_text_feild.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key,required this.onTap});

void signin(BuildContext context)async{
    //Auth service instace
    AuthService authService = AuthService();
    try {
      await authService.signUpWithEmailAndPassword(_emailController.text.toString(), _passwordControler.text.toString());
    }catch (e) {
        showDialog(
          context: context,
          builder: (context)=>AlertDialog(
            title: Text(e.toString()),
          )
        );
    }
  }
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
            "Hello there ! Good to see you too!",
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
          MyButton(text:"Register", onTap: ()=>signin(context)),
            //register toggle
             const SizedBox(height: 25.0,),
            GestureDetector(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have an account?",
                    style:TextStyle(
                      color: Theme.of(context).colorScheme.primary
                    )
                   ) ,
                    Text("Login now",
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
