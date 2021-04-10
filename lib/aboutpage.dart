import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

bool _isLoading = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :Center(
      child:Text('s4team',
           style: TextStyle(
             fontSize: 30,
             letterSpacing: 1,
           ),
            ),
    )
    );
  }
}