import 'package:codeforces/Common/MyDrawer.dart';
import 'package:flutter/material.dart';

class UpcomingContests extends StatefulWidget {
  @override
  _UpcomingContestsState createState() => _UpcomingContestsState();
}

class _UpcomingContestsState extends State<UpcomingContests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Upcoming Contests'),
      ),
    );
  }
}
