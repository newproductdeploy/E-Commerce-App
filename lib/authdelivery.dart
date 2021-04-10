import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newballariapp/deliverylogin.dart';
import 'package:newballariapp/pusddata.dart';

class AuthDelivery extends StatefulWidget {
  @override
  _AuthDeliveryState createState() => _AuthDeliveryState();
}

class _AuthDeliveryState extends State<AuthDelivery> {

 int neww  = 0;

  @override
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    if ( neww == 0){
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.active) {
                  User user = snapshot.data;
                  
                  if (user == null) {
                    neww+=1;
                    return DeliveryLogin();

                  } else {
                      return DeliveryChecking();
                  }
                }
                  return Scaffold(
            body: Center(
              child: Text("Checking",
              style: TextStyle(
                fontSize: 30,
                ),
                ),
              ),
          );
          },
          );
        }
          return Scaffold(
            body: Center(
              child: Text("Connecting",
              style: TextStyle(
                fontSize: 30,
                ),
                ),
              ),
          );
      },
    );
    }
  }
}