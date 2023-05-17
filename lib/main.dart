import 'package:flutter/material.dart';
import 'package:veil/src/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
void main() async {
  print('Loading Envs');
  await dotenv.load();
  
  print(dotenv.env);
  runApp(const App());
}
