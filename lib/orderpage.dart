import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:newballariapp/checkorder.dart';
import 'package:newballariapp/querypage.dart';
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right :13),
            child: TextButton(
              onPressed: (){
                 Navigator.push(context,MaterialPageRoute(
                   builder: (context) => QueryPage()),
             );
              }
            , child: Text('Order Issues ?',style: TextStyle(color: Colors.white,fontSize: 20),
            ),
            ),
          )
        ],
      ),
          body: 
          Container(
            constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("appimage.png"),
              fit: BoxFit.cover,
            ),
          ),
            child: Column(
              children :[ Center(
                child: Text("Order Here",
                style: TextStyle(
                  fontSize: 30,
                  height: 2,
                  ),
                  ),
                ),
                SizedBox(
                  height: 30,
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
                       style: ElevatedButton.styleFrom(primary: Colors.grey[700],onPrimary: Colors.white),
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
                       style: ElevatedButton.styleFrom(primary: Colors.grey[700],onPrimary: Colors.white),
                       onPressed: () {
                        Navigator.push(context,MaterialPageRoute(
                       builder: (context) => SelectItem(mobileno3: mobileno5)),
                        );
                     }, 
                    ),
                  ),
                ],
              ),
              SizedBox(
              height: 50,
             ),
              Text('Your Recent Orders :',
                style: TextStyle(fontSize: 23),),
               SizedBox(
              height: 20,
             ),
                SizedBox(
                  height: 300,
                  child: StreamBuilder(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
    
        return Flexible(
        child : new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return Container(
              height: 330,
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
                style: TextStyle(fontSize: 16)
                ),
                subtitle: new AutoSizeText('Track Your Order',style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:170),
                  child: ElevatedButton(
                   child: Text('Call',
                   style: TextStyle(
                     fontSize: 23,
                   ),
                   ),
                   style: ElevatedButton.styleFrom(primary: Colors.grey[700],onPrimary: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                   onPressed: () {
                     setState(() {
                          FlutterPhoneDirectCaller.callNumber(Text(document.data()['Deliveryboy Number']).toString().substring(5,16));
                            });
               },
                  ),
                ),
                new Divider(color: Colors.green[900],indent: 20.0,endIndent: 20.0),
              new ListTile(
                isThreeLine: true,
                leading: new Icon(Icons.shopping_cart),
                title: new Text(document.data()['Shopname']),
                subtitle: new AutoSizeText(document.data()['Items']),
              ),
              ],
              ),
              elevation: 5,
              margin: EdgeInsets.all(17),
            ),
            );
          }).toList(),
        ),
        );
      },
    ),
                ),
               ],
        ),
      ),
    );
  }
}