import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class DeliveryLogin extends StatefulWidget {
  @override
  _DeliveryLoginState createState() => _DeliveryLoginState();
}

class _DeliveryLoginState extends State<DeliveryLogin> {
  
  
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
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
                    else if(valueKey.length < 7) {
                      return "Weak Password";
                   }
                    else {
                     return null;
                   }
  }

  String _email;
  String _password;


  // ignore: missing_return
  Future<String> _login() async {
 try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _email,
    password: _password
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    Fluttertoast.showToast(
            msg: "Wrong Email Address",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
        );
  } else if (e.code == 'wrong-password') {
   Fluttertoast.showToast(
            msg: "Wrong Password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
        );
  }
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('#1'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("appimage.png"),
              fit: BoxFit.cover,
            ),
          ),
        child : Form(
        autovalidateMode: AutovalidateMode.always, key : formkey,
        child:Column(
        children: <Widget>[
          Center(
           child:Text('Delivey Login..',
           style: TextStyle(
             fontSize: 30,
             letterSpacing: 1,
             height: 5,
           ),
           ),
           ),
           SizedBox(
             height: 1,
           ),
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: TextFormField(
               onChanged: (value) {
                 _email = value;
               },
               decoration: InputDecoration(
                 border: OutlineInputBorder(),labelText: "Mail ID"),
                 validator: MultiValidator( 
                 [
                  RequiredValidator(errorText: 'Required'),
                 EmailValidator(errorText: 'Enter a valid email address'),
                ]             
             ),
               ),
           ),
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: TextFormField(
               onChanged: (value) {
                 _password = value;
               },
               decoration: InputDecoration(
                 border: OutlineInputBorder(),labelText: "Password"),
                 validator: validatepass,
               ),
           ),
           SizedBox(
             height: 1,
           ),
           Padding(
             padding: const EdgeInsets.all(11.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children :[
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: ElevatedButton(
                   child: Text('Login',
                   style: TextStyle(
                     fontSize: 23,
                   ),
                   ),
                   style: ElevatedButton.styleFrom(primary: Colors.grey[700],onPrimary: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
                   onPressed: () {
                    _login();
                 }, 
                ),
            ),
               ],
             ),
           ),
        ],
      ),
      ),
      ),
    );
  }
}