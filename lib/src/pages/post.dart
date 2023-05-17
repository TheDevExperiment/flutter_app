import 'package:flutter/material.dart';
import 'package:veil/src/pages/profile.dart';
import 'package:veil/src/pages/inbox.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserProfilePage()),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.chat),
            tooltip: 'Chats',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InboxPage()),
            ),
          ),
        ],
        title: const Text('Posts'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Popular Posts'),
            Tab(text: 'Nearby Posts'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          GridView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: index % 2 == 0 ? Colors.red : Colors.black,
              );
            },
          ),
          GridView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: index % 2 == 0 ? Colors.red : Colors.black,
              );
            },
          ),
        ],
      ),
    );
  }
}
