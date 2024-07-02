import 'package:crud_operations/model/auth_model.dart';
import 'package:crud_operations/screens/login_screened.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgotPasswordScreened extends StatefulWidget {
  const ForgotPasswordScreened({super.key});

  @override
  State<ForgotPasswordScreened> createState() => _ForgotPasswordScreenedState();
}

class _ForgotPasswordScreenedState extends State<ForgotPasswordScreened> {
  final TextEditingController emailController=TextEditingController();

  final AuthModel _authModel=AuthModel();
  final _emailController = TextEditingController();
  //final _formKey = GlobalKey<FormState>();

  Future<void> _resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Password reset email sent'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: ${e.toString()}'),
      ));
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(top: 200),
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/download.png'),
              ),
            ),
            SizedBox(height: 14,),
            Text('Forgot Password',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),

            SizedBox(height: 40,),
        Container(
          height: 50,
          width: 300,
          color: Colors.white,
          child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                hintStyle: TextStyle( color: Colors.black,fontSize: 14),
                hintText: 'Enter your registered email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.0))),
          ),
        ),
          SizedBox(height: 20,),
          Container(
            height: 50,
            width: 300,
            color: Colors.black54,
            child: TextButton(
              onPressed: (){
                _resetPassword();
              },
              child: Text('Reset Password',style: TextStyle(fontSize: 16),),
            ),
          )  ,
            SizedBox(height: 180,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('I know my Password go back to ',style: TextStyle(color: Colors.black),),
                InkWell(
                    onTap: (){
                      AuthModel().forgotPassword(emailController.text.toString());
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreened()));
                    },
                    child: Text('Login',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}



//
// class ForgotPasswordScreen extends StatefulWidget {
//   @override
//   _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
// }
//
// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   final _emailController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   Future<void> _resetPassword() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await FirebaseAuth.instance
//             .sendPasswordResetEmail(email: _emailController.text.trim());
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Password reset email sent'),
//         ));
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Error: ${e.toString()}'),
//         ));
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Forgot Password'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _resetPassword,
//                 child: Text('Send Password Reset Email'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
