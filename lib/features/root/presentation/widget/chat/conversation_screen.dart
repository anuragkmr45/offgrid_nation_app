// messages_screen.dart

import 'package:flutter/material.dart';
import 'package:offgrid_nation_app/features/root/presentation/widget/chat/chat_bubble.dart';
import 'package:offgrid_nation_app/features/root/presentation/widget/chat/chat_header.dart';
import 'package:offgrid_nation_app/features/root/presentation/widget/chat/chat_input.dart';

/// A cross-platform (iOS & Android) demo chat screen.
/// It uses platform-specific components (Cupertino vs. Material)
/// to provide the best native experience on each device.
class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<ConversationScreen> {
  // Demo conversation messages.
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hello! How are you?', 'time': '2:14 PM', 'isMe': false},
    {'text': 'I\'m good, thanks. And you?', 'time': '2:15 PM', 'isMe': true},
    {
      'text': 'Doing great! What are you up to?',
      'time': '2:16 PM',
      'isMe': false,
    },
  ];

  /// Called when the user sends a message.
  void _handleSend(String messageText) {
    // For demo, we use a static time. Later, replace with actual timestamps.
    setState(() {
      _messages.add({'text': messageText, 'time': '2:17 PM', 'isMe': true});
    });
  }

  /// Called when the back button is pressed.
  void _handleBack() {
    // For demonstration, simply print and pop the route.
    // print("Back button pressed");
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // Build the scaffold with a platform-specific header and message list.
    return Scaffold(
      // ChatHeader provides an iOS-style or Material-style top bar.
      appBar: ChatHeader(
        userName: 'John Doe',
        status: 'Active now',
        onBack: _handleBack,
      ),
      body: Column(
        children: [
          // Expanded ListView shows the conversation messages.
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ChatBubble(
                  message: msg['text'],
                  time: msg['time'],
                  isMe: msg['isMe'],
                );
              },
            ),
          ),
          // ChatInput lets the user type and send new messages.
          ChatInput(onSend: _handleSend),
        ],
      ),
    );
  }
}
