
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fire_function.dart';
class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Login'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           ElevatedButton(
               onPressed: (){
             FirebaseService.signInwithGoogle(context);
           },
               child: Text(' Login with Google',))
          ],
        ),
      ),
    );
  }
}
