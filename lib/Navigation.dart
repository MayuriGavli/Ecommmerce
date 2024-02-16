import 'package:e_commmerce1/FavoriteScreen.dart';
import 'package:e_commmerce1/HomePage.dart';
import 'package:e_commmerce1/OrderScreen.dart';
import 'package:e_commmerce1/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  int obj = 9;

  List<Widget> screen = [
    HomePage(),
    FavoriteScreen(),
    OrderScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.all(0.0),
            child: GNav(
              backgroundColor: Colors.blue,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.black12,
              gap: 6,
              tabs: const [
                GButton(icon: Icons.home, text: "Home"),
                GButton(icon: Icons.favorite, text: "Wishlist"),
                GButton(icon: Icons.card_giftcard_sharp, text: "My Order"),
                GButton(icon: Icons.account_box, text: "Profile"),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            )),
      ),
    );
  }
}
