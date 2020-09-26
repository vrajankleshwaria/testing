import 'package:codeforces/Common/build_snackbar.dart';
import 'package:codeforces/Helper/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  String _userName = "";
  TextEditingController _controller = new TextEditingController();

  _setUser(String userName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('userName', userName);
  }

  _userExist(String userName) async {
    var response = await http.get(userInfo + userName);
    print('-----' + (response.statusCode).toString());
    if (response.statusCode == 200) {
      print('User found');
      _setUser(_userName);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(_userName)),
      );
    } else {
      print('-----User not found');
      _scaffoldkey.currentState
          .showSnackBar(buildSnackBar("User " + _userName + " not found"));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    Widget _inputField = TextField(
      controller: _controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFf1f3f8),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 15.0, right: 10.0),
          child: Icon(
            Icons.person,
            color: Theme.of(context).primaryColor,
          ),
        ),
        //
        hintText: 'Codeforces Handle',
        //
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(width),
          borderSide: BorderSide(
            //color: Colors.transparent,
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
        //
        // border which will be displayed on selecting this field.
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(width),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 4.0,
          ),
        ),
      ),
    );

    // button
    Widget _button = RaisedButton(
      elevation: 5.0,
      color: Theme.of(context).primaryColor,
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: height * 0.025,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width),
      ),
      onPressed: () {
        setState(() {
          _userName = _controller.text;
          _userExist(_userName);
        });
      },
    );

    return Scaffold(
      key: _scaffoldkey,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.15, right: width * 0.15),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height * 0.25,
                ),
                _inputField,
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  height: height * 0.08,
                  width: width,
                  //color: Theme.of(context).primaryColor,
                  child: _button,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
