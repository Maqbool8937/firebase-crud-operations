import 'package:flutter/material.dart';
class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 20),
    child: Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20)
        )
      ),
      child: Wrap(
        runSpacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Column(
              children: [
                ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text('Mr.Jhon Alyson',style: TextStyle(fontWeight: FontWeight.bold),),
                //  subtitle: Text('version 1.0.1'),
                  trailing: Icon(Icons.settings,color: Colors.white,),
                  leading: CircleAvatar(
                    radius: 22.0,
                    backgroundImage: AssetImage('assets/images/img.png'),
                    backgroundColor: Colors.white,
                  ),

                ),
                SizedBox(height: 35,),
               Container(
                 height: 50,
                 width: 250,

                 decoration: BoxDecoration(
                     color:Colors.black54 ,
                   borderRadius: BorderRadius.circular(8)
                 ),
                 child: ListTile(
                   leading: Icon(Icons.home),
                   title: Text('Home'),
                   trailing: Icon(Icons.arrow_forward_ios),
                   
                 ),
               ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 250,
                  child: ListTile(
                    leading: Icon(Icons.category_sharp,color: Colors.white,),
                    title: Text('Categories',style: TextStyle(color: Colors.white),),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),

                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 250,
                  child: ListTile(
                    leading: Icon(Icons.heart_broken_sharp,color: Colors.white,),
                    title: Text('WishList',style: TextStyle(color: Colors.white),),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),

                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 250,
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                    title: Text('Cart',style: TextStyle(color: Colors.white),),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),

                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 250,
                  child: ListTile(
                    leading: Icon(Icons.person,color: Colors.white,),
                    title: Text('Profile',style: TextStyle(color: Colors.white),),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),

                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 250,
                  child: ListTile(
                    leading: Icon(Icons.help,color: Colors.white,),
                    title: Text('Help',style: TextStyle(color: Colors.white),),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),

                  ),
                ),
                SizedBox(height: 40.0,),
                Container(
                  height: 50,
                  width: 250,
                  child: ListTile(
                    leading: Icon(Icons.logout,color: Colors.white,),
                    title: Text('Logout',style: TextStyle(color: Colors.white),),
                   // trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),

                  ),
                ),
              ],
            ),
          ),

        ],
      ),
backgroundColor: Colors.amber,
    )
    );
  }
}
