import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  const [
        Text("Welcome!", style: TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.w400)),
         SizedBox(height: 15),
        Text("100% anonymous.\nConnect with like minded people.\nShare your confessions, news or just vent out.", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200)),
        
      ]
    );
  }

}