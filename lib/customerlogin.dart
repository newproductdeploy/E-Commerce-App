import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newballariapp/loginpage.dart';
import 'package:newballariapp/orderpage.dart';

class CustomerLogin extends StatefulWidget {
  @override
  _CustomerLoginState createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
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
                    return LoginPage();

                  } else {
                      return OrderPage();
                    
                    }
                }
                  return Scaffold(
            body: Center(
              child: Text("Checking Authentication",
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
              child: Text("waitUntilConnecting",
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
