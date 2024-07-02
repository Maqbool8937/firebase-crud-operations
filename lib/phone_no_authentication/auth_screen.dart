import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'otp_screen.dart';



class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Auth'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                  )
              ),
            ),
          ),

          ElevatedButton(onPressed: ()async{
            await FirebaseAuth.instance.verifyPhoneNumber(
                verificationCompleted: (PhoneAuthCredential credential){},
                verificationFailed: (FirebaseAuthException ex){},
                codeSent: (String verificationid, int? resendToken){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(verificationid: verificationid,)));
                },
                codeAutoRetrievalTimeout: (String verificationid){},phoneNumber: phoneController.text.toString());
          }, child: Text('Verify phone number'))
        ],
      ),
    );
  }
}
