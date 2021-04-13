import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :SingleChildScrollView(
         child  : Container(
        child :Column(
          mainAxisSize: MainAxisSize.min,
          children :[
            SizedBox(height: 130,
            ),
            Text("Terms And Conditions",style: TextStyle(fontSize: 23),),
            SizedBox(height: 50,),
             SizedBox(
              height: 400,
              width: 500,
              child: Image.asset('IfyAbout1.png')
              ),
          ],
         ),
         ),
      ), 
    );
  }
}