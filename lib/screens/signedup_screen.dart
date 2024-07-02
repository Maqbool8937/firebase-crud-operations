
import 'package:crud_operations/model/auth_model.dart';
import 'package:crud_operations/screens/Homed_screen.dart';
import 'package:crud_operations/screens/login_screened.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'auth_model.dart'; // Import the AuthModel

class SignedUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignedUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthModel _authModel = AuthModel();
 // final ImagePicker _picker = ImagePicker();
  File? _image;

  String name = '';
  String phone = '';
  String email = '';
  String address = '';
  String password = '';
  String confirmPassword = '';

  // Future<void> _pickImage() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     }
  //   });
  // }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Passwords do not match")),
        );
        return;
      }

      User? user = await _authModel.signUp(
        name: name,
        phone: phone,
        email: email,
        address: address,
        password: password,
       // confirmedPassword: confirmPassword,
        //image: _image,
      );

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sign up successful")),
        );

        // Navigate to the home screen or another screen
       // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomedScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sign up failed")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              GestureDetector(
               // onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: Colors.white,
                  )
                      : null,
                ),
              ),
              SizedBox(height: 15.0,),
              Center(child: Text('Join us',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: 350,
                color: Colors.white,
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Full Name'),
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: 350,
                color: Colors.white,
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Phone No'),
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: 350,
                color: Colors.white,
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Email'),
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: 350,
                color: Colors.white,
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Address'),
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: 350,
                color: Colors.white,
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Password'),
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: 350,
                color: Colors.white,
                child: TextFormField(
                  decoration: InputDecoration(labelText: ' Confirmed Password'),
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 20),
              Container(
                height: 50,
                width: 300,
                color: Colors.black54,
                child: TextButton(
                  onPressed: signUp,
                  child: Text('Sign Up'),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account,',style: TextStyle(color: Colors.black),),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreened()));
                      },
                      child: Text(' Login?',style: TextStyle(color: Colors.black,fontSize:16,fontWeight: FontWeight.bold),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
