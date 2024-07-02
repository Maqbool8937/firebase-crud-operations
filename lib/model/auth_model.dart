import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operations/screens/Homed_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class AuthModel{
//   final _formKey = GlobalKey<FormState>();
//   final _auth = FirebaseAuth.instance;
//   final _firestore = FirebaseFirestore.instance;
//
//   String name = '';
//   String phone = '';
//   String email = '';
//   String address = '';
//   String password = '';
//   String confirmPassword = '';
//
//   void signUp(BuildContext context,String email,String password) async {
//     if (_formKey.currentState!.validate()) {
//       if (password != confirmPassword) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Passwords do not match")),
//         );
//         return;
//       }
//
//       try {
//         UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//
//         // Save additional user information in Firestore
//         await _firestore.collection('users').doc(userCredential.user!.uid).set({
//           'name': name,
//           'phone': phone,
//           'email': email,
//           'address': address,
//         });
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Sign up successful")),
//         );
//
//         // Navigate to the home screen or another screen
//       } on FirebaseAuthException catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(e.message ?? "Sign up failed")),
//         );
//       }
//     }
//   }
// }


import 'package:firebase_storage/firebase_storage.dart';


class AuthModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<User?> signUp({
    required String name,
    required String phone,
    required String email,
    required String address,
    required String password,
    //required String confirmedPassword,
    // required File? image,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;


      await _firestore.collection('users').doc(user!.uid).set({
        'name': name,
        'phone': phone,
        'email': email,
        'address': address,
        // 'image_url': imageUrl,
      });


      return user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    return null;
  }

  Future<User?> loginuser( BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomedScreen()));
      User? user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }
  Future<void>forgotPassword(String email)async{
   try{
     await _auth.sendPasswordResetEmail(email: email);
   }catch(e){
     print(e.toString());
   }
  }
}

// if (user != null) {
//   String? imageUrl;
//
//   if (image != null) {
//     final ref = _storage.ref().child('user_images').child(user.uid + '.jpg');
//     await ref.putFile(image);
//     imageUrl = await ref.getDownloadURL();
//