import 'package:codeforces/Common/MyDrawer.dart';
import 'package:flutter/material.dart';

class Downloads extends StatefulWidget {
  @override
  _DownloadsState createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Downloads'),
      ),
    );
  }
}
