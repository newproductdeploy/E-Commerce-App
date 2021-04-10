import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserInformation extends StatefulWidget {

   String mobileno2;
   UserInformation({this.mobileno2});

  @override
  _UserInformationState createState() => _UserInformationState(mobileno2);
}

class _UserInformationState extends State<UserInformation> {

  String mobileno2;
  _UserInformationState(this.mobileno2);
  
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
    
  final Query users = FirebaseFirestore.instance.collection('appusers').doc('customers').collection(mobileno2).orderBy('Timestamp',descending: true);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('#1'),
      ),
      //heading or project name should be written
      body: Container(
        constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("appimage.png"),
              fit: BoxFit.cover,
            ),
          ),
        child: StreamBuilder(
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
              return Container(
                height: 300,
                child: new Card(
                  shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.grey[300],
                child: Column(
                children : <Widget>[
                new ListTile(
                  leading: new Icon(Icons.date_range),
                  title: new Text(document.data()['OrderedDate'],
                  style: TextStyle(color: Colors.white),),
                tileColor: Colors.grey[700],
                ),
                new ListTile(
                  leading: new Icon(Icons.shopping_cart),
                  title: new Text(document.data()['Shopname']),
                  subtitle: new Text(document.data()['Items']),
                ),
                ],
                ),
                elevation: 5,
                margin: EdgeInsets.all(17),
              ),
              );
            }).toList(),
          );
        },
    ),
      ),
    );
  }
}