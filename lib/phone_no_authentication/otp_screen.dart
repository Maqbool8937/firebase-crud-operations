import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../main.dart';

class OtpScreen extends StatefulWidget {
  String verificationid;
  OtpScreen({super.key,required this.verificationid});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Otp Screen'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
            child: TextField(
              controller: otpController,
              keyboardType:TextInputType.number,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.phone),
                  hintText: 'Enter your Otp Password',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                  )
              ),
            ),
          ),
          ElevatedButton(onPressed: ()async{
            try{
              PhoneAuthCredential credential=await PhoneAuthProvider.credential(
                  verificationId: widget.verificationid, smsCode: otpController.text.toString());
              FirebaseAuth.instance.signInWithCredential(credential).then((value) =>
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>MyHomePage(title: 'homePage'))));
            }catch(ex){
              log(ex.toString() as num);
            }
          }, child: Text('Otp Password')),
        ],
      ),
    );
  }
}