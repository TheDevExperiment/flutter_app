import 'package:flutter/material.dart';
import 'package:veil/src/pages/profile.dart';
import 'package:veil/src/pages/chat.dart';
class InboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: ListView(
        children: [
          ChatItem(name: 'John Doe'),
        ],
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;

  const ChatItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(name[0]),
      ),
      title: Text(name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage()),
        );
      },
    );
  }
}
