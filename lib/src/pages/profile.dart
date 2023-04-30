import 'package:flutter/material.dart';
import 'package:veil/src/pages/post.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PostPage()),
            );
          },
        ),
        title: const Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Name Here',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                label: const Text('Gender: Female'),
              ),
              Chip(
                label: const Text('Age: 25-34'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Karma Points'),
                    const Text('100'),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: null,
            child: const Text('Edit?'),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ],
      ),
    );
  }
}
