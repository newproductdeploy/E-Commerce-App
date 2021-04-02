import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
  String _error;

  // ignore: missing_return
  Future<String> _createUser() async {
  try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _email,
    password: _password);
} on FirebaseAuthException catch (e) {
  if (e.message == 'The email address is already in use by another account') {
    return 'Mail-ID Exists';
  }
} catch (e) {
  print(e);
  setState(() {
    _error = e.message;
    });
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('#1'),
      ),
      body: Container(
        child : Form(
        autovalidateMode: AutovalidateMode.always, key : formkey,
        child:Column(
        children: <Widget>[
          showError(),
          Center(
           child:Text('Customer Login..',
           style: TextStyle(
             fontSize: 30,
             letterSpacing: 1,
             height: 5,
           ),
           ),
           ),
           SizedBox(
             height: 8,
           ),
           Padding(
             padding: const EdgeInsets.all(15.0),
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
             padding: const EdgeInsets.all(15.0),
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
             height: 23,
           ),
           SizedBox(
             width: 240,
             height: 50,
             child: ElevatedButton(
               child: Text('Register/ನೋಂದಣಿ',
               style: TextStyle(
                 fontSize: 23,
               ),
               ),
               style: ElevatedButton.styleFrom(primary: Colors.green,onPrimary: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
               onPressed: () {
                _createUser();
             }, 
            ),
           ),
        ],
      ),
      ),
      ),
    );
  }


Widget showError(){
  if (_error != null){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(3.0),
      child: Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: Icon(Icons.error_outline),
          ),
          Expanded(child: AutoSizeText(_error,maxLines: 3,))
      ],
      ),
    );
  }
  return SizedBox(height: 0,);
  }
}