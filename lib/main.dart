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
        primaryColor: Color(0xFF2867B2), //linkedin logo color
        accentColor: Color(0xFF303F9F),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Authenticate(),
    );
  }
}
