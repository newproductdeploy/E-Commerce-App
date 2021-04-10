import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class QueryPage extends StatefulWidget {
  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('#1'),
      ),
      //heading or project name should be written
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("appimage.png"),
              fit: BoxFit.cover,
            ),
          ),
          child:Column(
           mainAxisSize: MainAxisSize.min,
           children: [Center(
             child:Text('Please Contact :',
             style: TextStyle(
               fontSize: 30,
               height: 4,
             ),
             ),
             ),
             SizedBox(
               height: 120,
             ),
             SizedBox(
               height: 40,
               width: 200,
               child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey[700],onPrimary: Colors.white),
                child: Text('Contact 1',
                style: TextStyle(fontSize: 20),),
                onPressed: (){
                  FlutterPhoneDirectCaller.callNumber("9110690815");
                },
            ),
             ),
             SizedBox(
               height: 40,
             ),
             SizedBox(
               height: 40,
               width: 200,
               child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey[700],onPrimary: Colors.white),
                child: Text('Contact 2',
                style: TextStyle(fontSize: 20),),
                onPressed: (){
                  FlutterPhoneDirectCaller.callNumber("7483212243");
                },
            ),
             ),
           ],
          ),
        ),
      ),
    );
  }
}