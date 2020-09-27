import 'package:codeforces/Helper/CircularIndicator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Register.dart';
import 'HomePage.dart';

// authentication class
// if 1st time then ask username (register)
// else redirect to home page directly

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

//  int count = 0;
  Widget build(BuildContext context) {
    if (_userName == null) {
      print("NULL USER");
      //return CircularIndicator(); // no meaning - for 0.01 sec !!!
      return Scaffold();
    } else if (_userName == "") {
//      count = count + 1;
//      print(count);
      print("new user ");
      return Register();
    } else {
      print("Old User");
      return HomePage(_userName);
    }
  }
}

// in some cases it is showing "new user" twice because // mainly while restarting app
