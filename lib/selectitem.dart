import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newballariapp/orderpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import "dart:math";

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

  get platform => null;
  Future<void> getUserData() async{
    User userdata = await FirebaseAuth.instance.currentUser;
    setState(() {
          user = userdata;
        });
  }

  final Telephony telephony = Telephony.instance;

  var list = ['deliveryboy1@gmail.com','deliveryboy2@gmail.com'];

  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
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

  
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
    appBar: AppBar(
      title: Text('#1'),
      automaticallyImplyLeading: false,
      ),
              body : GestureDetector(
                onTap: (){
                  FocusScope.of(context).unfocus();
                },
              child :Center(
                child : Container(
                  constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("appimage.png"),
              fit: BoxFit.cover,
            ),
          ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                    children: [Text('Enter Details Correctly',style: TextStyle(fontSize: 25)
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,key: formkey,
                            decoration: InputDecoration(
                              icon: Icon(Icons.verified_user_outlined),
                              labelText: "Username"),
                              onChanged: (value) {
                   _username = value;
               },
                            ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.always,key: formkey2,
                            decoration: InputDecoration(
                              icon: Icon(Icons.location_on),
                              labelText: "Address"),
                              onChanged: (value) {
                   _address = value;
               },
                            ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.always,key: formkey3,
                            decoration: InputDecoration(
                              icon: Icon(Icons.shopping_cart),
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
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 300,
                              child: DropdownButton<String>(
                                dropdownColor: Colors.brown[50],
                                icon: Icon(Icons.shop),
                                value: _shopname.isNotEmpty ? _shopname : null,
          items: [
            DropdownMenuItem<String>(
              child: Text('Shop 1'),
              value: 'Shop 1',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 2'),
              value: 'Shop 2',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 3'),
              value: 'Shop 3',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 4'),
              value: 'Shop 4',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 5'),
              value: 'Shop 5',
            ),
          ],
          onChanged: (String value) {
            setState(() {
              _shopname = value;
            });
          },
          hint: Text('Select Shop     '),
        ),
                            ),

                            SizedBox(
                              height: 80,
                            ),
                            ElevatedButton(
                                  child: Text('Place Order',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  ),
                                  style: ElevatedButton.styleFrom(primary: Colors.grey[700],onPrimary: Colors.white),
                                  onPressed: () {
                                        telephony.sendSmsByDefaultApp(
                                          to: "9110690815",
                                          message: "May the force be with you!"
                                          );
                                                Fluttertoast.showToast(
                                                msg: "Order Placed-Thank You",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                          );          
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

    final DateTime now = DateTime. now();

    final DateFormat formatter = DateFormat('dd-MM-yyyy');

Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //To TimeStamp

final String formatted = formatter. format(now);

    Map<String,String> customerdetails = {

      'Username' : name,
      'Mobile No' :mobileno3,
      'Address' : address,
      'Items' : items,
      'Shopname' : shopname,
      'Timestamp' :myTimeStamp.toString(),
      'OrderedDate' : formatted,
      };

     var element = getRandomElement(list);
    referDatabase.doc('customers').collection(mobileno3).add(customerdetails);
    referDatabase.doc('deliveryboy').collection(element).add(customerdetails);
  }
}