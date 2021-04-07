import 'package:flutter/material.dart';
import 'package:newballariapp/checkorder.dart';
import 'package:newballariapp/selectitem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderPage extends StatefulWidget {
  

  String mobileno5;
  OrderPage({this.mobileno5});
  
  @override
  _OrderPageState createState() => _OrderPageState(mobileno5);
}

class _OrderPageState extends State<OrderPage> {


String mobileno5;
_OrderPageState(this.mobileno5);
  
  @override
  Widget build(BuildContext context) {

    final Query users = FirebaseFirestore.instance.collection('appusers').doc('customers').collection(mobileno5).orderBy('Timestamp',descending: true).limit(2);
    return Scaffold(
            appBar: AppBar(
        title: Text('#1'),
      ),
          body: Container(
            child: Column(
              children :[ Center(
                child: Text("Order Here!!",
                style: TextStyle(
                  fontSize: 30,
                  height: 2,
                  ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text('Your Recent Order :',
                style: TextStyle(fontSize: 23),),
                SizedBox(
              height: 10,
             ),
                SizedBox(
                  height: 350,
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
              height: 200,
              child: new Card(
              child: Column(
              children : <Widget>[
              new ListTile(
                leading: new Icon(Icons.shopping_cart),
                title: new Text(document.data()['Shopname']),
                subtitle: new Text(document.data()['Items']),
              ),
              new Divider(color: Colors.green[900],indent: 20.0,endIndent: 20.0),
              new ListTile(
                leading: new Icon(Icons.phone),
                title: new Text(document.data()['Address']),
                subtitle: new Text(document.data()['Mobile No']),
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
              
                SizedBox(
              height: 100,
             ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children :[
                   Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: ElevatedButton(
                       child: Text('Order History',
                       style: TextStyle(
                         fontSize: 18,
                       ),
                       ),
                       style: ElevatedButton.styleFrom(primary: Colors.green,onPrimary: Colors.white),
                       onPressed: () {
                        Navigator.push(context,MaterialPageRoute(
                       builder: (context) => UserInformation(mobileno2 :mobileno5)),
                        );
                     }, 
                  ),
                   ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                       child: Text('New Order',
                       style: TextStyle(
                         fontSize: 19,
                       ),
                       ),
                       style: ElevatedButton.styleFrom(primary: Colors.green,onPrimary: Colors.white),
                       onPressed: () {
                        Navigator.push(context,MaterialPageRoute(
                       builder: (context) => SelectItem(mobileno3: mobileno5)),
                        );
                     }, 
                    ),
                  ),
                ],
              ),
             ],
        ),
      ),
    );
  }
}