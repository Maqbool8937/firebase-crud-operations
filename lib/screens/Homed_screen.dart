import 'package:flutter/material.dart';

import 'drawer_widget.dart';
class HomedScreen extends StatefulWidget {
  const HomedScreen({super.key});

  @override
  State<HomedScreen> createState() => _HomedScreenState();
}

class _HomedScreenState extends State<HomedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Padding(
          padding: const EdgeInsets.only(right: 9,),
          child: Text('Good Morniong Jhon!',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ),
        backgroundColor: Colors.amber,
      actions: [
        Row(
          children: [
            Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 25,),
            SizedBox(width: 10,),
            Icon(Icons.notifications_none_sharp,color: Colors.white,size: 25,)
          ],
        )
      ],
      ),
    //  d
      //  rawer: Icon(Icons.abc_outlined),
    drawer:DrawerWidget() ,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
           Row(
             children: [
               Container(
                 height: 50,
                 width: 250,
                // color: Colors.grey,
                 child: TextFormField(
                   decoration: InputDecoration(

                     hintText: 'Search here',
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                   ),
                 ),
               ),
               SizedBox(width: 22,),
               Container(
                 height: 50,
                 width: 50,
                 // color: Colors.grey,
                 child: TextFormField(
                   decoration: InputDecoration(
                               hintText: '',
                     //  icon: Icon(Icons.manage_search),
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(3))
                   ),
                 ),
               )
             ],
           ),
            SizedBox(height: 14,),

          ],
        ),
      ),

      //backgroundColor: Colors.red,
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         Container(

           decoration: BoxDecoration(
             color: Colors.amber,

           ),
           child: IconButton( onPressed: (){},
               icon: Row(children: [Icon(Icons.home,color: Colors.white,),
                 Text('home',style: TextStyle(color: Colors.white),)],)),
         ),
          SizedBox(width: 6.0,),
          IconButton(onPressed: (){},
              icon: Icon(Icons.chat,color: Colors.white,)),
          IconButton(onPressed: (){},
              icon: Icon(Icons.favorite_outline,color: Colors.white,)),
          IconButton(onPressed: (){},
              icon: Icon(Icons.person,color: Colors.white,))

        ],

      ),
      // backgroundColor: Colors.black54,

    );
  }
}
