import 'package:flutter/material.dart';
import 'package:offgrid_nation_app/core/ui_share/custom_searchbar.dart';
import 'package:offgrid_nation_app/features/root/presentation/widget/chat/chat_list_item.dart';
// import your bottom nav if you have one

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Sample data
  final List<Map<String, dynamic>> _chatList = [
    {
      'avatarUrl':
          'https://images.unsplash.com/photo-1580842196926-c9355fbc3d79',
      'userName': 'Claudia Alves',
      'subText': 'We bend so we don’t break.',
      'timeLabel': 'Now',
      'unreadCount': 1,
    },
    {
      'avatarUrl':
          'https://images.unsplash.com/photo-1607746882042-944635dfe10e',
      'userName': 'Cahaya Dewi',
      'subText': 'Happiness is a habit.',
      'timeLabel': '2 Min',
      'unreadCount': 2,
    },
    {
      'avatarUrl':
          'https://images.unsplash.com/photo-1595152772835-219674b2a8a6',
      'userName': 'Avery Davis',
      'subText': 'Don’t just fly. Soar.',
      'timeLabel': '5 Hours',
      'unreadCount': 0,
    },
    {
      'avatarUrl': 'https://images.unsplash.com/photo-1544723795-3fb6469f5b39',
      'userName': 'Aaron Loeb',
      'subText': 'Allow yourself joy.',
      'timeLabel': '5 Hours',
      'unreadCount': 3,
    },
    {
      'avatarUrl':
          'https://images.unsplash.com/photo-1621290085992-1b155db69734',
      'userName': 'Lorna Alvarado',
      'subText': 'Keep it simple.',
      'timeLabel': '22 Hours',
      'unreadCount': 0,
    },
    {
      'avatarUrl':
          'https://images.unsplash.com/photo-1590073242679-3c6ad04317d1',
      'userName': 'Olivia Wilson',
      'subText': 'Yesterday',
      'timeLabel': 'Yesterday',
      'unreadCount': 1,
    },
    {
      'avatarUrl':
          'https://images.unsplash.com/photo-1517841905240-472988babdf9',
      'userName': 'Yael Amari',
      'subText': 'You got this.',
      'timeLabel': '2 Weeks ago',
      'unreadCount': 0,
    },
  ];

  void _onSearchChanged(String query) {
    // For now, do nothing. Later, filter _chatList by 'query'.
  }

  void _onSearchSubmitted(String query) {
    // For now, do nothing. Later, filter or search an API.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // If your entire screen background is blue in the design, you can set it here:
      backgroundColor: Colors.blue,
      // If you want an AppBar with the brand logo or a title, add it here.
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text('Messages', style: TextStyle(color: Colors.white)),
        centerTitle: false,
      ),
      // If you have a bottom nav, you can add a bottomNavigationBar property:
      // bottomNavigationBar: CustomBottomNavBar(),
      body: Column(
        children: [
          // The search bar at the top
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchBar(
              controller: _searchController,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
              hintText: 'Search...',
            ),
          ),
          // The list of message items
          Expanded(
            child: Container(
              // The main background for the list area
              color: Colors.white, // or keep it blue if you prefer
              child: ListView.separated(
                itemCount: _chatList.length,
                separatorBuilder:
                    (context, index) =>
                        const Divider(height: 1, color: Colors.grey),
                itemBuilder: (context, index) {
                  final chat = _chatList[index];
                  return ChatListItem(
                    avatarUrl: chat['avatarUrl'],
                    userName: chat['userName'],
                    // subText: chat['subText'],
                    timeLabel: chat['timeLabel'],
                    // unreadCount: chat['unreadCount'],
                    onTap: () {
                      // Navigate to conversation screen or do something else
                      // print('Tapped on ${chat['userName']}');
                      Navigator.pushNamed(
                        context,
                        '/conversation',
                        arguments: chat, // Pass the chat data if needed
                      );
                    },
                    lastMessage: '',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
