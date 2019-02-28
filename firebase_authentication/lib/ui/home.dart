import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new homestate();

}



class homestate extends State<Home>{



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
          
            
            Text('Dashboard'),
            SizedBox(height:5.0,),

             FlatButton(
              child: Text('Logout'),
              color: Colors.cyan[500],
              textColor:Colors.white ,
              onPressed: (){
                  FirebaseAuth.instance.signOut().then((value){
                  Navigator.of(context).pushReplacementNamed('/landingpage');
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