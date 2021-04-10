import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

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
    final Query users = FirebaseFirestore.instance.collection('appusers').doc('deliveryboy').collection(user.email).orderBy('Timestamp',descending: true);
    
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
                height: 400,
                child: new Card(
                  shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.grey[300],
                child: Column(
                children : <Widget>[
                new ListTile(
                  leading: new Icon(Icons.verified_user),
                  title: new Text(document.data()['Username']),
                  subtitle: new Text(document.data()['Mobile No'])
                  ),
                  SizedBox(
             width: 100,
             height: 30,
             child: Padding(
               padding: const EdgeInsets.only(left: 1),
               child: ElevatedButton(
                 child: Text('Call',
                 style: TextStyle(
                   fontSize: 23,
                 ),
                 ),
                 style: ElevatedButton.styleFrom(primary: Colors.grey[700],onPrimary: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                 onPressed: () {
                   setState(() {
                        FlutterPhoneDirectCaller.callNumber(Text(document.data()['Mobile No']).toString().substring(5,16));
                          });
               },
                ),
             ),
           ),
                new Divider(color: Colors.green[900],indent: 20.0,endIndent: 20.0),
                new ListTile(
                  leading: new Icon(Icons.phone),
                  title: new Text(document.data()['Address']),
                  subtitle: new Text(document.data()['OrderedDate']),
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
      ),
    );
  }
}