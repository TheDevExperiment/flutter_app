import 'package:flutter/material.dart';

class NewPostBottomsheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewPostBottomsheet();
}

class _NewPostBottomsheet extends State<NewPostBottomsheet> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              child: Text(
                "New post",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("What's your secret?"),
            TextField(
              controller: _controller,
            ),
            const Text("Choose background"),
            Align(child: ElevatedButton(onPressed: () {}, child: const Text("Post!")))
          ],
        ),
      ),
    );
  }
}
