import 'package:flutter/material.dart';
import '../../features/discover/discover_screen.dart';
import '../../features/favorites/favorites_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/message/message_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  _AppBottomNavBarState createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    HomeScreen(),
    DiscoverScreen(),
    FavoritesScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  final List<String> _activeIcons = [
    ImageStrings.homeactive,
    ImageStrings.discoveractive,
    ImageStrings.favoriteactive,
    ImageStrings.messageactive,
    ImageStrings.profileactive,
  ];

  final List<String> _inactiveIcons = [
    ImageStrings.homeinactive,
    ImageStrings.discoverinactive,
    ImageStrings.favoriteinactive,
    ImageStrings.messageinactive,
    ImageStrings.profileinactive,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: TColors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: List.generate(5, (index) {
          return BottomNavigationBarItem(
            icon: Image.asset(
              _selectedIndex == index ? _activeIcons[index] : _inactiveIcons[index],
              height: 24,
            ),
            label: '',
          );
        }),
      ),
    );
  }
}