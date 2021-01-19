import 'package:flutter/material.dart';
import 'package:video_streamer/pages/lander.dart';
import 'package:video_streamer/pages/profile.dart';

/// The Home (Now on Sale) Page.
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  static final String customAppThemeId = 'custom_theme';

  @override
  _HomePageState createState() => _HomePageState();
}

/// The Movies Page.
class _HomePageState extends State<HomePage> {
  // Bottom navigation tab index, reflects current selected tab.
  int _currentIndex = 0;
  String _title;

  @override
  initState() {
    super.initState();
    _title = 'Some default value';
  }

  // Tab indecies for bottom navigation.
  final List<Widget> _children = [
    LanderPage(),
    LanderPage(), //Should be Search Page
    LanderPage(), //Should be Download Page
    ProfilePage(), //Should be Settings Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_outlined),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: onTabTapped,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Home';
          }
          break;
        case 1:
          {
            _title = 'Search';
          }
          break;
        case 2:
          {
            _title = 'Downloaded';
          }
          break;
        case 3:
          {
            _title = 'Settings';
          }
          break;
      }
    });
  }
}
