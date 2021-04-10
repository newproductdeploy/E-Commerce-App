import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newballariapp/orderpage.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                    else if(valueKey.length < 10 || valueKey.length > 10) {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('#1'),
      ),
      //heading or project name should be written
      body: GestureDetector(
                onTap: (){
                  FocusScope.of(context).unfocus();
                },
              child :Container(
        constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("appimage.png"),
              fit: BoxFit.cover,
            ),
          ),
        child:Column(
         mainAxisSize: MainAxisSize.min,
         children: [Center(
           child: AutoSizeText('Enter number to continue',
           style: TextStyle(
             fontSize: 28,
             height: 7,
           ),
           ),
           ),
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: TextFormField(
               onChanged: (value) {
                   mobileno = value;
                 },
               keyboardType: TextInputType.number,
                              autovalidateMode: AutovalidateMode.always,key: formkey,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),labelText: "Mobile No",
                              focusColor: Colors.black,),
                              validator : validatepass,
                            ),
           ),
           SizedBox(
            height: 35,
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
               style: ElevatedButton.styleFrom(primary: Colors.grey[700],onPrimary: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
               onPressed: () {
                 pushno();
             },
              ),
           ),
         ],
        ),
      ),
      ),
    );
  }
  Future<String> pushno() async{
try{
   
   if(mobileno.length == 10){
      Navigator.push(context,MaterialPageRoute(
                   builder: (context) => OrderPage(mobileno5 :mobileno)),
             );
   }else if(mobileno.isEmpty){
      Fluttertoast.showToast(
            msg: "Enter a Valid Number",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
        );
   }else{
      Fluttertoast.showToast(
            msg: "Enter a Valid Number",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
      );
   }
}catch(e){
   print(e);
}
return null;
}
}