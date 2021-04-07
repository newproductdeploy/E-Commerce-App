import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newballariapp/orderpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SelectItem extends StatefulWidget {

  String mobileno3;
  SelectItem({this.mobileno3});

  @override
  _SelectItemState createState() => _SelectItemState(mobileno3);
}

class _SelectItemState extends State<SelectItem> {

  String mobileno3;
  _SelectItemState(this.mobileno3);
  
  final referDatabase = FirebaseFirestore.instance.collection('appusers');

  User user;
  Future<void> getUserData() async{
    User userdata = await FirebaseAuth.instance.currentUser;
    setState(() {
          user = userdata;
        });
  }

  String _username = '';
    String _address = '';
    String _enteritems =''; 
    String _shopname = '';

  @override
  void initState(){
    super.initState();
    getUserData();
  }

  final formkey = GlobalKey<FormState>();
  final formkey1 = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();
  final formkey3 = GlobalKey<FormState>();
  final formkey4 = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState.validate())
    {
      print("Validated");
    } else {
      print("Not validated");
    }
  }

  void validater(){
    if(formkey1.currentState.validate())
    {
      print("Validated");
    } else {
      print("Not validated");
    }
  }

  void validaterr(){
    if(formkey2.currentState.validate())
    {
      print("Validated");
    } else {
      print("Not validated");
    }
  }

  void validaterrr(){
    if(formkey3.currentState.validate())
    {
      print("Validated");
    } else {
      print("Not validated");
    }
  }

  void validaterrrr(){
    if(formkey4.currentState.validate())
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
                    autovalidateMode: AutovalidateMode.always,key: formkey,
                          decoration: InputDecoration(
                            labelText: "Username"),
                            onChanged: (value) {
                 _username = value;
               },
                          ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,key: formkey2,
                          decoration: InputDecoration(
                            labelText: "Address"),
                            onChanged: (value) {
                 _address = value;
               },
                          ),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.always,key: formkey3,
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
                            autovalidateMode: AutovalidateMode.always,key: formkey4,
                          decoration: InputDecoration(
                            labelText: "Shop name"),
                            onChanged: (value) {
                 _shopname = value;
               },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                                child: Text('Place Order',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                ),
                                style: ElevatedButton.styleFrom(primary: Colors.green,onPrimary: Colors.white),
                                onPressed: () {
                                  saveDetails();
                                  Navigator.push(context,
                                  MaterialPageRoute(
                            builder: (context) => OrderPage(mobileno5: mobileno3))
                            );
                            }, 
                            ),
                          ],
                     ),
                ),
              ),
    );
  }

  void saveDetails(){

    String name = _username;
    String address = _address;
    String items = _enteritems;
    String shopname = _shopname;

    
    DateTime currentPhoneDate = DateTime.now(); //DateTime

Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //To TimeStamp

DateTime myDateTime = myTimeStamp.toDate(); 

    Map<String,String> customerdetails = {

      'Username' : name,
      'Mobile No' : '+91 - ' +mobileno3,
      'Address' : address,
      'Items' : items,
      'Shopname' : shopname,
      'Timestamp' :myTimeStamp.toString(),
      };
    referDatabase.doc('customers').collection(mobileno3).add(customerdetails);
    referDatabase.doc('deliveryboy').collection('orders').add(customerdetails);
  }
}