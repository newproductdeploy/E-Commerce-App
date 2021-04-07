import 'package:flutter/material.dart';
import 'package:newballariapp/orderpage.dart';

class NumberPage extends StatefulWidget {
  @override
  _NumberPageState createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {


final formkey = GlobalKey<FormState>();

void validate(){
    if(formkey.currentState.validate())
    {
      print("Validated");
    } else {
      print("Not validated");
    }
  }

String validatepass(valueKey){
    if (valueKey.isEmpty) {
                     return "Required";
                   }
                    else if(valueKey.length < 10) {
                      return "10 Digits Please";
                   }
                    else {
                     return null;
                   }
  }

String mobileno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('#1'),
      ),
      //heading or project name should be written
      body: Container(
        child:Column(
         mainAxisSize: MainAxisSize.min,
         children: [Center(
           child:Text('Enter the number to continue',
           style: TextStyle(
             fontSize: 28,
             letterSpacing: 1,
             height: 4,
           ),
           ),
           ),
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: TextFormField(
                              autovalidateMode: AutovalidateMode.always,key: formkey,
                            decoration: InputDecoration(
                              labelText: "Mobile No"),
                              validator : validatepass,
                              onChanged: (value) {
                   mobileno = value;
                 },
                            ),
           ),
           SizedBox(
            height: 50,
           ),
           SizedBox(
             width: 250,
             height: 50,
             child: ElevatedButton(
               child: Text('Proceed',
               style: TextStyle(
                 fontSize: 23,
               ),
               ),
               style: ElevatedButton.styleFrom(primary: Colors.green,onPrimary: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
               onPressed: () {
                 Navigator.push(context,MaterialPageRoute(
                   builder: (context) => OrderPage(mobileno5 :mobileno)),
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