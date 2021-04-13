import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  Future<void> _launchURL() async {
    final Email email = Email(
      recipients: ['s4teamdevelopers@gmail.com'],
      isHTML: false,
    );
    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Thank You For Contacting';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :SingleChildScrollView(
         child  : Container(
        child :Column(
          mainAxisSize: MainAxisSize.min,
          children :[
            SizedBox(height: 50,
            ),
            Center(
              child: CircleAvatar(
              backgroundImage: AssetImage('logo.jpg'),
              radius: 50,
              ),
            ), 
            SizedBox(height: 30),
            SizedBox(
              height: 350,
              width: 500,
              child: Image.asset('IfyAbout1.png')
              ),
               SizedBox(height: 30),
             ElevatedButton(
               child: Text('Contact Us',
               style: TextStyle(
                 fontSize: 23,
               ),
               ),
                style: ElevatedButton.styleFrom(primary: Colors.grey[700],onPrimary: Colors.white),
               onPressed: () {
                 _launchURL();
             },
              ),
        ],
      ),
      ),
      ),
    );
  }
}