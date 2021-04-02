import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {

  final refolddata = FirebaseFirestore.instance.collection('appusers');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: (){
          getUsers();
        }, child: Text('click here'),
      ),
    );
  }
  void demo() async{
    String myDocId = 'user.uid';
    DocumentSnapshot documentSnapshot;

    await FirebaseFirestore.instance.collection('customers').doc(myDocId).get().then((value) {
          documentSnapshot.id;
    });
  }
  getUsers(){
    refolddata.get().then((snapshot){
      snapshot.docs.forEach((doc) { 
        print(doc.id);
      });
    });
  } 
}

