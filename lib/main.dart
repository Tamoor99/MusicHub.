import 'package:flutter/material.dart';
import 'screens/login_signup.dart';
import 'screens/search.dart';
import 'screens/bollywood.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'MusicHub',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home:login_signup(),
    );

  }
  }






