import 'package:codeforces/Common/MyDrawer.dart';
import 'package:codeforces/Screens/Downloads.dart';
import 'package:codeforces/Screens/PastContests.dart';
import 'package:codeforces/Screens/Problems.dart';
import 'package:codeforces/Screens/Profile.dart';
import 'package:codeforces/Screens/UpcomingContests.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final String userName;
  HomePage(this.userName);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  //Widget myBottomNavBar =

  final List<Widget> pages = [
    Profile(),
    UpcomingContests(),
    PastContests(),
    Problems(),
    Downloads(),
  ];

  _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          return true;
        }
        setState(() {
          _selectedIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        body: SafeArea(child: pages[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[100],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text('Profile'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.next_week,
              ),
              title: Text('Upcoming'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.content_paste,
              ),
              title: Text('Past'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.code,
              ),
              title: Text('Problems'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.file_download,
              ),
              title: Text('Downloads'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          onTap: _onTap,
        ),
      ),
    );
  }
}

// willpopscope -- ask user to again press back to exit from app
