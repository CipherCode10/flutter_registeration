import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new loginstate();

}



class loginstate extends State<LoginPage>{

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
              child: Text('Login'),
              color: Colors.cyan[500],
              textColor:Colors.white ,
              onPressed: (){
                FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcont.text , password: passcont.text).then((FirebaseUser user){
                  Navigator.of(context).pushReplacementNamed('/home');
                }).catchError((e){
                  print(e);
                });
              },
            ),
            SizedBox(height:5.0,),
            Text('Don\'t have an account '),
            SizedBox(height:5.0,),

             FlatButton(
              child: Text('Register'),
              color: Colors.cyan[500],
              textColor:Colors.white ,
              onPressed: (){
                  Navigator.of(context).pushNamed('/register');
              },
            ),

          ],
        ),
      ),

    );

  }

}