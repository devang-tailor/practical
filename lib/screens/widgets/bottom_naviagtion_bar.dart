import 'package:flutter/material.dart';
import 'package:practicaldevang/infrasturcture/constants/color_constant.dart';
import 'package:practicaldevang/screens/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    const Text('Packages'),
    const Text('Bookings'),
    const Text('Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Title'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home,color: ColorConstant.secondaryColor,),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.percent,color: ColorConstant.secondaryColor,),
            icon: Icon(Icons.percent),
            label: 'Packages',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.schedule,color: ColorConstant.secondaryColor,),
            icon: Icon(Icons.schedule),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person,color: ColorConstant.secondaryColor,),
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}