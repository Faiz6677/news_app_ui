import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui/screens/discover_screen.dart';
import 'package:news_app_ui/screens/home_screen.dart';
import 'package:news_app_ui/screens/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int index;

  const BottomNavBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0.0,
      unselectedIconTheme: IconThemeData(color: Colors.grey, size: 25),
      selectedIconTheme: IconThemeData(color: Colors.black, size: 30),
      items: [
        BottomNavigationBarItem(
            icon: Container(
                margin: EdgeInsets.only(left: 50),
                child: IconButton(
                  padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    icon: Icon(Icons.home))),
            label: 'home'),
        BottomNavigationBarItem(
            icon: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pushNamed(context, DiscoverScreen.routeName);
                },
                icon: Icon(Icons.saved_search_rounded)),
            label: 'home'),
        BottomNavigationBarItem(
            icon: Container(
                margin: EdgeInsets.only(right: 50),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pushNamed(context, ProfileScreen.routeName);
                    },
                    icon: Icon(Icons.person))),
            label: 'home'),
      ],
    );
  }
}
