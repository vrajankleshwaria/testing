import 'package:codeforces/Common/MyDrawer.dart';
import 'package:flutter/material.dart';

class PastContests extends StatefulWidget {
  @override
  _PastContestsState createState() => _PastContestsState();
}

class _PastContestsState extends State<PastContests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Past Contests'),
      ),
    );
  }
}
