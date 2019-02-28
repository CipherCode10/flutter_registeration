import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/utils/userdatabase.dart';


class RegisterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new registerstate();

}



class registerstate extends State<RegisterPage>{

  TextEditingController emailcont = new TextEditingController();
  TextEditingController passcont = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red[100],
      ),

      body: Container(
        margin: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'your email',
                icon: Icon(Icons.email),
              ),
              controller: emailcont,
            ),

          SizedBox(height:5.0,),

          TextField(
              decoration: InputDecoration(
                hintText: 'your password',
                icon: Icon(Icons.vpn_key),
              ),
              controller: passcont,
            ),

            SizedBox(height:5.0,),

            FlatButton(
              child: Text('Register'),
              color: Colors.cyan[500],
              textColor:Colors.white ,
              onPressed: (){
                FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcont.text , password: passcont.text).then((Signeduser){
                  UserDatabase().addNewUser(Signeduser, context);
                }).catchError((e){
                  print(e);
                });
              },
            ),

          ],
        ),
      ),

    );

  }

}