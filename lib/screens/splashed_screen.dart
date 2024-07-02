import 'dart:async';

import 'package:flutter/material.dart';

import 'login_screened.dart';
class SplashedScreen extends StatefulWidget {
  const SplashedScreen({super.key});

  @override
  State<SplashedScreen> createState() => _SplashedScreenState();
}

class _SplashedScreenState extends State<SplashedScreen> {

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreened(),  // Navigate to the home screen
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SafeArea(child: Container(
            padding: EdgeInsets.only(top: 220),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/img_1.png'),
          
                    ),
                  ),
          SizedBox(height: 15.0,),
                Text('Gifts Land',style: TextStyle(color:Colors.black,fontSize: 26,fontWeight: FontWeight.bold))
              ],
            ),
          
          ),
          
          ),
          Container(
             padding: EdgeInsets.only(top: 180,),

              child: Text('Powered By Nimz Solutions Ltd',style: TextStyle(color: Colors.black),))
        ],
      ),

    );
  }
}
