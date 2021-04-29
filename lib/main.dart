import 'package:flutter/material.dart';
import 'screen/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food delivery app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       scaffoldBackgroundColor: Colors.grey[50],

        primaryColor: Colors.deepOrangeAccent,
      ),
      home: homeScreen(),
    );
  }
}




