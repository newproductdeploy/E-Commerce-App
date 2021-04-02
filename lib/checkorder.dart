import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  
  User user;
  Future<void> getUserData() async{
    User userdata = await FirebaseAuth.instance.currentUser;
    setState(() {
          user = userdata;
        });
  }


  @override
  void initState(){
    super.initState();
    getUserData();
  }
  
  
  @override
  Widget build(BuildContext context) {
    
    CollectionReference users = FirebaseFirestore.instance.collection('appusers').doc('customers').collection(user.email);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('#1'),
      ),
      //heading or project name should be written
      body: StreamBuilder(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new Card(
            child : ListTile(
              title: new Text(document.data()['Shopname']),
              subtitle: new Text(document.data()['Items']),
            ),
            );
          }).toList(),
        );
      },
    ),
    );
  }
}