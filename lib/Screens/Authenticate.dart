import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Register.dart';
import 'HomePage.dart';

// authentication class
// if 1st time then ask username (register)
// else redirect to home page directly

// NO NEED OF STATEFUL WIDGET I THINK

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  String _userName;

  @override
  void initState() {
    super.initState();
    _getUserName();
  }

  _getUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _userName = pref.getString('userName') ?? "";
    });
  }

  Widget build(BuildContext context) {
    if (_userName == null) {
      //return Center(child: CircularProgressIndicator());
      return Scaffold();
    } else if (_userName == "") {
      print("New User");
      return Register();
    } else {
      print("Old User");
      return HomePage(_userName);
    }
  }
}
