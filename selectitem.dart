import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newballariapp/orderpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SelectItem extends StatefulWidget {
  @override
  _SelectItemState createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  
  final referDatabase = FirebaseFirestore.instance.collection('appusers');

  User user;
  Future<void> getUserData() async{
    User userdata = await FirebaseAuth.instance.currentUser;
    setState(() {
          user = userdata;
        });
  }

  String _username = '';
    String _mobileno = '';
    String _address = '';
    String _enteritems =''; 
    String _shopname = '';

  @override
  void initState(){
    super.initState();
    getUserData();
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState.validate())
    {
      print("Validated");
    } else {
      print("Not validated");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('#1'),
      automaticallyImplyLeading: false,
      ),
              body : Center(
                child : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                  children: [Text('Enter Details Correctly',style: TextStyle(fontSize: 25)
                  ),
                  TextFormField(
                          decoration: InputDecoration(
                            labelText: "Username"),
                            onChanged: (value) {
                 _username = value;
               },
                          ),
                  TextFormField(
                            autovalidateMode: AutovalidateMode.always,key: formkey,
                          decoration: InputDecoration(
                            labelText: "Mobile No"),
                            validator : (_mobileno){
                              if (_mobileno.isEmpty) {
                            return 'Required';
                          }
                          return null;
                            },
                            onChanged: (value) {
                 _mobileno = value;
               },
                          ),
                    TextFormField(
                          decoration: InputDecoration(
                            labelText: "Address"),
                            onChanged: (value) {
                 _address = value;
               },
                          ),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                          decoration: InputDecoration(
                            labelText: "Enter Items"),
                            validator : (_enteritems){
                              if (_enteritems.isEmpty) {
                            return 'Required';
                          }
                          return null;
                            },
                            onChanged: (value) {
                 _enteritems = value;
               },
                          ),
                          TextFormField(
                          decoration: InputDecoration(
                            labelText: "Shop name"),
                            onChanged: (value) {
                 _shopname = value;
               },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                                child: Text('Place Order',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                ),
                                style: ElevatedButton.styleFrom(primary: Colors.green,onPrimary: Colors.white),
                                onPressed: () {
                                  saveContact();
                                  Navigator.push(context,
                                  MaterialPageRoute(
                            builder: (context) => OrderPage())
                            );
                            }, 
                            ),
                          ],
                     ),
                ),
              ),
    );
  }

  void saveContact(){

    String name = _username;
    String mobileno = _mobileno;
    String address = _address;
    String items = _enteritems;
    String shopname = _shopname;

    
    DateTime currentPhoneDate = DateTime.now(); //DateTime

Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //To TimeStamp

DateTime myDateTime = myTimeStamp.toDate(); 

    Map<String,String> customerdetails = {

      'Username' : name,
      'Mobile No' : '+91 - ' +mobileno,
      'Address' : address,
      'Items' : items,
      'Shopname' : shopname,
      'Timestamp' :myTimeStamp.toString(),
      'Status' : 'Undelivered',
      };
    referDatabase.doc('customers').collection(user.email).add(customerdetails);
  }
}