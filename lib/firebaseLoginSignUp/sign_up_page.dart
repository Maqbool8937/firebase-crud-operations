import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';

import '../UiHelper/helper_ui_data.dart';
import '../main.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  signUp(String email,String password)async{
    if(email==""&& password==""){
      return UiHelper.CustomAlertBox(context, 'Enter Required Fields');

    }else{
      UserCredential?usercredential;
      try{
        usercredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,
            password: password).then((value) {
          return  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'MyHomePage')));
        });
      }on FirebaseAuthException catch(ex){
        UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextFeild(emailController, 'Email', Icons.email, false),
          UiHelper.CustomTextFeild(passwordController, 'password', Icons.password, true),
          SizedBox(height: 30,),
          UiHelper.CustomButton(() {

            signUp(emailController.text.toString(),
                passwordController.text.toString());
          }, 'SignUp',),
        ],
      ),
    );
  }
}
