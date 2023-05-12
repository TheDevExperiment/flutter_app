import 'package:flutter/material.dart';
import 'package:veil/src/pages/inbox.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> messages = [];

  void _sendMessage() {
    String message = _textEditingController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        messages.add(message);
        _textEditingController.clear();
      });
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) => ChatMessageItem(
                name: 'John Doe',
                chatMessage: messages[index],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessageItem extends StatelessWidget {
  final String name;
  final String chatMessage;

  const ChatMessageItem({
    required this.name,
    required this.chatMessage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://i.pinimg.com/564x/cd/cb/01/cdcb01ebeef668284a58c06f5b08708e.jpg'),
      ),
      title: Text(name),
      subtitle: Text(chatMessage),
    );
  }
}
