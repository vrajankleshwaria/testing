import 'package:flutter/material.dart';
import '../Common/build_snackbar.dart';

class HomePage extends StatefulWidget {
  final String userName;

  HomePage(this.userName);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

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
