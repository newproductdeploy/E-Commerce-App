import 'package:flutter/material.dart';

class SellerLogin extends StatefulWidget {
  @override
  _SellerLoginState createState() => _SellerLoginState();
}

class _SellerLoginState extends State<SellerLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('#1'),
      ),
    body :Center(
      child:Text('Enter Your Details',
           style: TextStyle(
             fontSize: 30,
             letterSpacing: 1,
           ),
            ),
    )
    );
  }
}