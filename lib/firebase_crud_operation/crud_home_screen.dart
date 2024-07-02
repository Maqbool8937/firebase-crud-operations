// In this screen there are performed Crud Operations:
// means:Update,Add,Delete data in real time from firebase firestore data base.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class CrudHomeScreen extends StatefulWidget {
  const CrudHomeScreen({super.key});

  @override
  State<CrudHomeScreen> createState() => _CrudHomeScreenState();
}

class _CrudHomeScreenState extends State<CrudHomeScreen> {
  TextEditingController nameController = TextEditingController();
  bool subscriber = false;
  bool updateSubscriber = false;
  User? user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
     title: Text('Crud Operations '),
     backgroundColor: Colors.blue,
     centerTitle: true,
   ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(hintText: "Name"),
          ),
          SizedBox(height: 10.0,),
          ElevatedButton(onPressed: ()async{
            //for sending data on firebase firestore:
            await db.collection('maqbool').add({'name': nameController.text, 'subscribe': subscriber});
            setState(() {
              subscriber = !subscriber;
            });
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Subscribed"), backgroundColor: Colors.green,),
            );
          },
              child:  subscriber == false
                  ? const Text("Subscribe")
                  : const Text("Subscribed"),
          ),
          //Retrieving data or getting data from firebase firestore:
          StreamBuilder(
              stream: db.collection('maqbool').snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
               if(!snapshot.hasData){
                 return Center(
                   child: CircularProgressIndicator(),
                 );
               }else{
                 return Expanded(
                     child: ListView.builder(
                         itemCount: snapshot.data?.docs.length,
                         itemBuilder:(context,int index){
                           DocumentSnapshot documentSnapshot =
                           snapshot.data.docs[index];
                           return ListTile(
                             title: Text(documentSnapshot['name']),
                             //for deleting data from list
                             trailing: IconButton(onPressed: (){
                               db.collection('maqbool').doc(documentSnapshot.id).delete();
                               ScaffoldMessenger.of(context).showSnackBar(
                                   const SnackBar(content: Text("Deleted"), backgroundColor: Colors.red,));
                             },
                               icon: Icon(Icons.delete),
                             ),
                             leading: ElevatedButton(onPressed: ()async{
                                setState(() {
                                  updateSubscriber!=updateSubscriber;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Unsubscribed"), backgroundColor: Colors.amber,));
                                db.collection('maqbool').doc(documentSnapshot.id).update({'subscribe':updateSubscriber});
                             },
                                 //ternory operate:
                                 child: documentSnapshot['subscribe'] != false
                                     ? const Text("Subscribe")
                                     : const Text("Subscribed")));


                         }
                         )
                 );
               }
              })

        ],
      ),
    );
  }
}
