import 'package:codeforces/Screens/Authenticate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codeforces app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2867B2), //linked in logo color
        accentColor: Colors.green, // green is temporary
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.white70, // was spoiling buttons
      ),
      home: Authenticate(),
    );
  }
}
