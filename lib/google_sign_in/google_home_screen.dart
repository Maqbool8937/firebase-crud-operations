

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class GoogleHomeScreen extends StatefulWidget {
  const GoogleHomeScreen({super.key});

  @override
  State<GoogleHomeScreen> createState() => _GoogleHomeScreenState();
}

class _GoogleHomeScreenState extends State<GoogleHomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Home Screen'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(user!.email!,style: TextStyle(fontSize: 18),),
                Text(user!.displayName!,style: TextStyle(fontSize: 18),),
                SizedBox(height: 10,),
                CircleAvatar(
                  backgroundImage: NetworkImage(user!.photoURL!),
                  radius: 40,
                )
              ],
            )));

  }
}
