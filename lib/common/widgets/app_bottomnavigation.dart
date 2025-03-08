import 'package:flutter/material.dart';
import '../../features/discover/discover_screen.dart';
import '../../features/favorites/favorites_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/message/message_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class AppBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const AppBottomNavBar({super.key, required this.currentIndex});

  @override
  _AppBottomNavBarState createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
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
      backgroundColor: TColors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: TColors.white,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: List.generate(
              _screens.length,
                  (index) => BottomNavigationBarItem(
                icon: Image.asset(
                  _selectedIndex == index ? _activeIcons[index] : _inactiveIcons[index],
                  height: 24,
                ),
                label: '',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
