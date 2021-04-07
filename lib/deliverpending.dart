import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryPending extends StatefulWidget {
  @override
  _DeliveryPendingState createState() => _DeliveryPendingState();
}

class _DeliveryPendingState extends State<DeliveryPending> {

  CollectionReference referDatabase = FirebaseFirestore.instance.collection('appusers');

  DocumentReference documentReference = FirebaseFirestore.instance.collection('appusers').doc('deliveryboy').collection('orders').doc();

  User user;
  Future<void> getUserData() async{
    User userdata = await FirebaseAuth.instance.currentUser;
    setState(() {
          user = userdata;
        });
  }

Future<void> get_docId(DocumentReference documentReference) async{
  DocumentSnapshot documentSnapshot  = await documentReference.get();
  var docid = documentSnapshot.id;
  print(docid);
  return docid;
}

  @override
  void initState(){
    super.initState();
    getUserData();
  }

String textHolder = 'Pending';

changeText() {
 
    setState(() {
     textHolder = 'Delivered'; 
    });
    
  }

  
  @override
  Widget build(BuildContext context) {
    final Query users = FirebaseFirestore.instance.collection('appusers').doc('deliveryboy').collection('orders').orderBy('Timestamp',descending: true);
    
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
            return Container(
              height: 270,
              child: new Card(
              child: Column(
              children : <Widget>[
              new ListTile(
                leading: new Icon(Icons.verified_user),
                title: new Text(document.data()['Username']),
              ),
              new Divider(color: Colors.green[900],indent: 20.0,endIndent: 20.0),
              new ListTile(
                leading: new Icon(Icons.phone),
                title: new Text(document.data()['Address']),
                subtitle: new Text(document.data()['Mobile No']),
              ),
                new Divider(color: Colors.green[900],indent: 20.0,endIndent: 20.0),
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
    );
  }
}