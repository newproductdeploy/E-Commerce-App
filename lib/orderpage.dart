import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newballariapp/checkorder.dart';
import 'package:newballariapp/selectitem.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text('#1'),
      ),
          body: Container(
            child: Column(
              children :[ Center(
                child: Text("You Can Order here",
                style: TextStyle(
                  fontSize: 30,
                  height: 2,
                  ),
                  ),
                ),
                SizedBox(
              height: 550,
             ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children :[
                   Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: ElevatedButton(
                       child: Text('Order History',
                       style: TextStyle(
                         fontSize: 18,
                       ),
                       ),
                       style: ElevatedButton.styleFrom(primary: Colors.green,onPrimary: Colors.white),
                       onPressed: () {
                        Navigator.push(context,MaterialPageRoute(
                       builder: (context) => UserInformation()),
                        );
                     }, 
                  ),
                   ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                       child: Text('Select Items',
                       style: TextStyle(
                         fontSize: 19,
                       ),
                       ),
                       style: ElevatedButton.styleFrom(primary: Colors.green,onPrimary: Colors.white),
                       onPressed: () {
                        Navigator.push(context,MaterialPageRoute(
                       builder: (context) => SelectItem()),
                        );
                     }, 
                    ),
                  ),
                ],
              ),
             ],
        ),
      ),
            floatingActionButton : FloatingActionButton(
               child: Text('logout',
               style: TextStyle(
                 fontSize: 13,
                 height: 2,
               ),
               ),
               onPressed: ()  async{
                 await FirebaseAuth.instance.signOut();
                }, 
            ),
          );
        }
}