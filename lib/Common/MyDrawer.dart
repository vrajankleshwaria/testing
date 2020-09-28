import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            _createDrawerHeader,
          ],
        ),
      ),
    );
  }
}

Widget _createDrawerHeader = DrawerHeader();
