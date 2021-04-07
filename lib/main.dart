import 'package:flutter/material.dart';
import 'package:newballariapp/authdelivery.dart';
import 'package:newballariapp/number.dart';
import 'package:newballariapp/sellerlogin.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( 
        primaryColor: Colors.green[700],
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('#1'),
      ),
      //heading or project name should be written
      body: Container(
        child:Column(
         mainAxisSize: MainAxisSize.min,
         children: [Center(
           child:Text('Who are you..',
           style: TextStyle(
             fontSize: 30,
             letterSpacing: 1,
             height: 7,
           ),
           ),
           ),
           SizedBox(
            height: 50,
           ),
           SizedBox(
             width: 250,
             height: 50,
             child: ElevatedButton(
               child: Text('Customer/ಗ್ರಾಹಕ',
               style: TextStyle(
                 fontSize: 23,
               ),
               ),
               style: ElevatedButton.styleFrom(primary: Colors.green,onPrimary: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
               onPressed: () {
                 Navigator.push(context,MaterialPageRoute(
                   builder: (context) => NumberPage()),
             );
             },
             onLongPress: (){
               print('Customer login button');
             },
             ),
           ),
           SizedBox(
             height: 30,
           ),
            SizedBox(
             width: 250,
             height: 50,
             child: ElevatedButton(
               child: Text('Delivery/ವಿತರಣೆ',
               style: TextStyle(
                 fontSize: 23,
               ),
               ),
               style: ElevatedButton.styleFrom(primary: Colors.green,onPrimary: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
               onPressed: () {
                 Navigator.push(context,MaterialPageRoute(
                   builder: (context) => AuthDelivery()),
             );
             },
             onLongPress: (){
               print('Delivery login button');
             },
             ),
           ),
           SizedBox(
             height: 30,
           ),
           SizedBox(
             width: 250,
             height: 50,
             child: ElevatedButton(
               child: Text('Seller/ಮಾರಾಟಗಾರ',
               style: TextStyle(
                 fontSize: 23,
               ),
               ),
               style: ElevatedButton.styleFrom(primary: Colors.green,onPrimary: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
               onPressed: () {
                 Navigator.push(context,MaterialPageRoute(
                   builder: (context) => SellerLogin()),
             );
             },
             onLongPress: (){
               print('Seller login button');
             },
             ),
           ),
           SizedBox(
             height: 150,
           ),
           SizedBox(
             height: 60,
              child: Text('By S4 Team',
               style: TextStyle(
                 fontSize: 25,
               ),
              ),
           ),
         ],
        ),
        )
    );
  }
}