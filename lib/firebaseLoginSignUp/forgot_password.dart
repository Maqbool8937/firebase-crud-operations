import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../UiHelper/helper_ui_data.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController=TextEditingController();
  forgortPassword(String email)async{
    if(email==""){
      return UiHelper.CustomAlertBox(context, 'Enter an email to reset the password');
    }else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextFeild(emailController, 'Email', Icons.email, false),
          UiHelper.CustomButton(() {
            forgortPassword(emailController.text.toString());
          }, 'Forgot Password')
        ],
      ),
    );
  }
}
