import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
            Text("It's For You -> Ify : Privacy Policy",style: TextStyle(fontSize: 23),),
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