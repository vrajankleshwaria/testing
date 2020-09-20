import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String userName;

  HomePage(this.userName);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Welcome'),
      ),
      body: Center(
        child: Text(
          'Welcome ${widget.userName}',
        ),
      ),
    );
  }
}
