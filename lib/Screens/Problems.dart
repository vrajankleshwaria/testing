import 'package:codeforces/Common/MyDrawer.dart';
import 'package:flutter/material.dart';

class Problems extends StatefulWidget {
  @override
  _ProblemsState createState() => _ProblemsState();
}

class _ProblemsState extends State<Problems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Problems'),
      ),
    );
  }
}
