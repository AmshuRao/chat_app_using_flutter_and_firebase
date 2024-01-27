

import "dart:developer";

import "package:firebase_auth/firebase_auth.dart";


class AuthService
{
  //instance of firebase auth
  final FirebaseAuth _auth  = FirebaseAuth.instance;

  //signin method
  Future<UserCredential> signInWithEmailAndPassword(email,password)async{
      try {
          UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
          return userCredential;
      }
      on FirebaseAuthException catch(e) {
        log("i am here inside the log");
          throw Exception(e.code);
      }
    
      
    }
     //signup method
    Future<UserCredential> signUpWithEmailAndPassword(String email,String password)async
    {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        throw Exception(e.code);
      }
    }

     //sign out method
    Future<void> signOut()async{
      return await _auth.signOut();
    }
      //erros

}
 