import 'package:flutter/material.dart';
import 'package:offgrid_nation_app/core/ui_share/custom_searchbar.dart';
import 'package:offgrid_nation_app/features/root/presentation/widget/account_list_item.dart';
import 'package:offgrid_nation_app/features/root/presentation/widget/search_screen_tabs.dart';
import 'package:offgrid_nation_app/features/root/presentation/widget/topic_list_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _currentTabIndex = 0;

  // Sample profiles data.
  final List<Map<String, String>> _profiles = const [
    {
      'name': 'Claudia Alves',
      'handle': '@claudia',
      'avatarUrl':
          'https://images.unsplash.com/photo-1580842196926-c9355fbc3d79',
    },
    {
      'name': 'Cahaya Dewi',
      'handle': '@catko',
      'avatarUrl':
          'https://images.unsplash.com/photo-1607746882042-944635dfe10e',
    },
  ];

  final List<Map<String, String>> _topics = const [
    {
      'title': 'Earthquake',
      'imageUrl':
          'https://images.unsplash.com/photo-1605609456765-3e564c7e2c6e',
    },
    {
      'title': 'Flood',
      'imageUrl':
          'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05',
    },
    {
      'title': 'Wildfire',
      'imageUrl':
          'https://images.unsplash.com/photo-1568740894164-b391886c2ec7',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    // Handle search query changes.
  }

  void _onSearchSubmitted(String query) {
    // Handle search submission.
  }

  // Callback for when a tab is selected.
  void _onTabSelected(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  // EDITED: Update content based on the selected tab.
  Widget _buildTabContent() {
    if (_currentTabIndex == 0) {
      // First tab: Render list of ProfileListItem widgets.
      return ListView.separated(
        itemCount: _profiles.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final profile = _profiles[index];
          return ProfileListItem(
            name: profile['name']!,
            handle: profile['handle']!,
            avatarUrl: profile['avatarUrl']!,
            onFollow: () {
              // Handle follow button tap.
            },
          );
        },
      );
    } else {
      // Second tab: Render placeholder content.
      return ListView.separated(
        itemCount: _topics.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final topic = _topics[index];
          return TopicListItem(
            title: topic['title']!,
            imageUrl: topic['imageUrl']!,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue, // Background color.
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomSearchBar(
              controller: _searchController,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
              hintText: 'Search...',
            ),
            const SizedBox(height: 16),
            CustomTabBar(
              currentIndex: _currentTabIndex,
              onTabSelected: _onTabSelected,
            ),
            const SizedBox(height: 16),
            Expanded(child: _buildTabContent()),
          ],
        ),
      ),
    );
  }
}
