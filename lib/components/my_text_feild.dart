import 'package:flutter/material.dart';


class MyTextFeild extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isHide;
  const MyTextFeild(
    {
      super.key,
      required this.hintText,
      required this.controller,
      required this.isHide
    }
    );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary
            )
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color:Theme.of(context).colorScheme.primary,),
          
      
           
        ),
        controller: controller,
        obscureText: isHide,
      ),
    );
  }
}