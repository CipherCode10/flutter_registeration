import 'package:flutter/material.dart';
import 'package:firebase_authentication/ui/home.dart';
import 'package:firebase_authentication/ui/login.dart';
import 'package:firebase_authentication/ui/register.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new LoginPage(),

      routes: <String , WidgetBuilder>{
        
        '/landingpage':(BuildContext context) => new MyApp(),
        '/register' :(BuildContext context) => new RegisterPage(),
        '/home' :(BuildContext context) => new Home(),


      },





    );
  }
}
