import 'package:crud_operations/model/auth_model.dart';
import 'package:crud_operations/screens/signedup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../UiHelper/helper_ui_data.dart';
import 'Homed_screen.dart';
import 'forgot_screened.dart';
class LoginScreened extends StatefulWidget {
  const LoginScreened({super.key});

  @override
  State<LoginScreened> createState() => _LoginScreenedState();
}

class _LoginScreenedState extends State<LoginScreened> {
  final AuthModel _authModel=AuthModel();
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  String email='';
  String password='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 100,),
                Center(
                  child: CircleAvatar(
                    radius: 60,
                  backgroundImage: AssetImage('assets/images/img_1.png'),
                  ),
                  
                ),
                SizedBox(height: 20.0,),
                Text('Welcome back!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),),
                SizedBox(height: 50.0,),
          
                _customEmail(),
                SizedBox(height: 20,),
            _customPassword(),
               Padding(
                 padding: const EdgeInsets.only(top: 10,right: 18),
                 child: Align(
                   alignment: Alignment.centerRight,
                   child: InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreened()));
                     },
                     child: Text('Forgot Password?',
                       style: TextStyle(color: Colors.black),),
                   ),
                 ),
               ),
                SizedBox(height: 80,),
                _loginButton(),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.rectangle_outlined),
                    SizedBox(width: 8,),
                    Text('Agree to Terms and Conditions',style: TextStyle(color: Colors.black,fontSize: 16),),
          
          
                    ],
                  ),
                SizedBox(height: 30.0,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don;t have an account, ',style: TextStyle(color: Colors.black,fontSize: 16),),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignedUpScreen()));
                            },
                            child: Text('Create?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),))
                      ],
                    )
                  ],
                )
          
          
              ],
            ),
          ),
        ),
    );
  }
  Widget _customEmail(){
    return Container(
      height: 50,
      width: 300,
      color: Colors.white,
      child: TextFormField(
        controller: _emailController,
   decoration: InputDecoration(
     hintStyle: TextStyle( color: Colors.black,fontSize: 14),
     hintText: 'Username/Email',
       border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(2.0))),
      ),
    );
  }
  Widget _customPassword(){
    return Container(
      height: 50,
      width: 300,
      color: Colors.white,
      child: TextFormField(
        controller: _passwordController,
        decoration: InputDecoration(
            hintStyle: TextStyle( color: Colors.black,fontSize: 14),
            hintText: 'Password',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.0))),
      ),
    );
  }
  Widget _loginButton(){
    return Container(
      height: 50,
      width: 300,

      decoration: BoxDecoration(
         // background: #615A5A;
  color: Colors.black54
        // border: Border.all(color: Colors.white)
      ),
      child: TextButton(
        onPressed: (){
          AuthModel().loginuser(context,_emailController.text.toString(),
              _passwordController.text.toString());
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomedScreen()));
          // login(_emailController.text.toString(),
          //     _passwordController.text.toString());
        },
        child: Text('Login'),
      ),
    );
  }
  // login(String email,String password)async{
  //   if(email==""&&password==""){
  //     return UiHelper.CustomAlertBox(context, 'Enter Required Fields');
  //   }else{
  //     UserCredential?usercredential;
  //     try{
  //       usercredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,
  //           password: password).then((value){
  //         return  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomedScreen()));
  //       });
  //
  //     }on FirebaseAuthException catch(ex){
  //       return UiHelper.CustomAlertBox(context, ex.code.toString());
  //     }
  //   }
  // }
}
