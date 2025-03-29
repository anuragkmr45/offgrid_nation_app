import 'package:flutter/material.dart';
import 'package:offgrid_nation_app/features/root/wrapper/main_wrapper.dart';
import 'package:offgrid_nation_app/features/root/presentation/screens/home_screen.dart';
import 'package:offgrid_nation_app/features/root/presentation/screens/search_screen.dart';
import 'package:offgrid_nation_app/features/root/presentation/screens/add_post_screen.dart';
import 'package:offgrid_nation_app/features/root/presentation/screens/messages_screen.dart';
import 'package:offgrid_nation_app/features/root/presentation/screens/premium_screen.dart';

/// RootScreen manages the bottom navigation's state and shows the appropriate page.
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  // Holds the current tab index.
  int _currentTabIndex = 0;

  // List of pages corresponding to each bottom navigation item.
  final List<Widget> _screens = [
    const FeedScreen(), // Home/Feed screen
    const SearchScreen(), // Search screen
    const AddPostScreen(), // Add post screen
    const MessagesScreen(), // Messages screen
    const PremiumScreen(), // Premium screen
  ];

  // Updates the current tab index when a navigation icon is tapped.
  void _onTabSelected(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainWrapper(
      currentTabIndex: _currentTabIndex,
      onTabSelected: _onTabSelected,
      child: IndexedStack(index: _currentTabIndex, children: _screens),
    );
  }
}
