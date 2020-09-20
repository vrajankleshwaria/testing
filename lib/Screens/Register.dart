import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _userName = "";
  TextEditingController _controller = new TextEditingController();

  _setUser(String userName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString('userName', userName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Theme.of(context).primaryColor,
//        title: Text('Register'),
//      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Codeforcesss Handle",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: RaisedButton(
                  elevation: 10.0,
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _userName = _controller.text;
                      _setUser(_userName);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(_userName)),
                      );
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
