
import 'package:firebase_auth/firebase_auth.dart';



import 'package:flutter/material.dart';

import '../UiHelper/helper_ui_data.dart';
import '../main.dart';

import 'forgot_password.dart';

import 'sign_up_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
        backgroundColor: Colors.blue,

      ),
      body: SingleChildScrollView(
         padding: EdgeInsets.only(top: 150.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomTextFeild(emailController,
                'Email',Icons.email , false),
            UiHelper.CustomTextFeild(passwordController, 'password', Icons.password, true),
            SizedBox(height: 50,),
            UiHelper.CustomButton(() {
        
              login(emailController.text.toString(), passwordController.text.toString());
            },
                "Login"
        
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account??',style: TextStyle(fontSize: 18),),
                TextButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpPage()));
                }, child: Text('SignUp',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),)),
        
              ],
            ),
            SizedBox(height: 20,),
            TextButton(onPressed: (){
        
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
            }, child: Text('Forgot Password',style: TextStyle(fontSize: 18),))
          ],
        ),
      ),
    );
  }
  login(String email,String password)async{
    if(email==""&&password==""){
      return UiHelper.CustomAlertBox(context, 'Enter Required Fields');
    }else{
      UserCredential?usercredential;
      try{
        usercredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,
            password: password).then((value){
          return  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'login')));
        });

      }on FirebaseAuthException catch(ex){
        return UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }
}
