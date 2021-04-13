import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newballariapp/orderpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import "dart:math";
import 'package:telephony/telephony.dart';

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

    String delivername = '';

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
            DropdownMenuItem<String>(
              child: Text('Shop 6'),
              value: 'Shop 6',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 7'),
              value: 'Shop 7',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 8'),
              value: 'Shop 8',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 9'),
              value: 'Shop 9',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 10'),
              value: 'Shop 10',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 11'),
              value: 'Shop 11',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 12'),
              value: 'Shop 12',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 13'),
              value: 'Shop 13',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 14'),
              value: 'Shop 14',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 15'),
              value: 'Shop 15',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 16'),
              value: 'Shop 16',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 17'),
              value: 'Shop 17',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 18'),
              value: 'Shop 18',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 19'),
              value: 'Shop 19',
            ),
            DropdownMenuItem<String>(
              child: Text('Shop 20'),
              value: 'Shop 20',
            ),
          ],
          onChanged: (String value) {
            setState(() {
              _shopname = value;
            });
          },
          hint: Text('Select Shop'),
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

    var element = getRandomElement(list);

    if (element == 'deliveryboy1@gmail.com'){

          delivername ='9535315502';
    }else{
          delivername ='9110690815';

    }

    telephony.sendSms(
	  to:delivername,
    message: "Order Arrived"
	  );

    telephony.sendSms(
	  to:"7483212243",
    message: "Order Arrived"
    );
    //telephony.sendSms(
	  //to: "9945160844",
	  //message: "Order Arrived"
	  //);

    DateTime currentPhoneDate = DateTime.now(); //DateTime

    final DateTime now = DateTime.now();

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
      'Deliveryboy Number' :delivername,
      };


    referDatabase.doc('customers').collection(mobileno3).add(customerdetails);
    referDatabase.doc('deliveryboy').collection(element).add(customerdetails);
  }
}