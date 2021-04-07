import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newballariapp/deliverpending.dart';

class DeliveryChecking extends StatefulWidget {
  @override
  _DeliveryCheckingState createState() => _DeliveryCheckingState();
}

class _DeliveryCheckingState extends State<DeliveryChecking> {
  @override

  User userdata = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Text('#1'),
      ),
      
      body: Container(
        child:Column(
         mainAxisSize: MainAxisSize.min,
         children: [Center(
           child:Text('Check For Any Orders',
           style: TextStyle(
             fontSize: 30,
             letterSpacing: 1,
             height: 2,
           ),
           ),
           ),
           SizedBox(
            height: 250,
           ),
           SizedBox(
             width: 250,
             height: 48,
             child: ElevatedButton(
               child: Text('Delivery Requests',
               style: TextStyle(
                 fontSize: 24,
               ),
               ),
               style: ElevatedButton.styleFrom(primary: Colors.green[600],onPrimary: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
               onPressed: () {
                Navigator.push(context,MaterialPageRoute(
                   builder: (context) =>DeliveryPending()),
             );
             },
            ),
           ),
           SizedBox(
             height: 150,
           ),
           SizedBox(
             height: 40,
             child: ElevatedButton(
               child: Text('logout',
               style:TextStyle(fontSize: 23),
               ),
                style: ElevatedButton.styleFrom(primary: Colors.green[600],onPrimary: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
             onPressed: ()  async{
                   await FirebaseAuth.instance.signOut();
                  },
             ),
           )
         ],
    ),
      ),
    );
  }
}