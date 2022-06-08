import 'package:flutter/material.dart';

import 'home_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  final _screens = [
    HomeScreen(),
    const Scaffold(bottomNavigationBar: Center(child: Text('Explore'))),
    const Scaffold(bottomNavigationBar: Center(child: Text('Add'))),
    const Scaffold(bottomNavigationBar: Center(child: Text('subscriptions'))),
    const Scaffold(bottomNavigationBar: Center(child: Text('Library'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: _screens
              .asMap()
              .map(
                (i, screen) => MapEntry(
                  i,
                  Offstage(
                    offstage: _selectedIndex != i,
                    child: screen,
                  ),
                ),
              )
              .values
              .toList()),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedFontSize: 10.0,
      unselectedFontSize: 10.0,
      onTap: (index) {
        setState(
          () {
            _selectedIndex = index;
          },
        );
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          activeIcon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          activeIcon: Icon(Icons.add_circle),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.subscriptions_outlined),
          activeIcon: Icon(Icons.subscriptions),
          label: 'Subscriptions',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library_outlined),
          activeIcon: Icon(Icons.video_library),
          label: 'Library',
        ),
      ],
    );
  }
}
