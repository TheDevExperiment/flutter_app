import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:veil/src/pages/profile.dart';
import 'package:veil/src/pages/register.dart';
import 'package:veil/src/pages/post.dart';

class App extends StatelessWidget {
  const App({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veil',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Color.fromARGB(255, 187, 180, 212),
      ),
      home: const HomePage(title: 'Veil'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showRegisterScreen = false;
  bool _loading = false;
  bool _error = false;

  void _checkToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token != null) {
      setState(() {
        _loading = true;
      });
      try {
        // make network call here to validate token
        // if token is valid, move to post.dart page
        // otherwise, move to register page
        setState(() {
          _loading = false;
        });
      } catch (e) {
        setState(() {
          _loading = false;
          _error = true;
        });
      }
    } else {
      setState(() {
        _showRegisterScreen = true;
      });
    }
  }

  void _saveToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      // make network call here to create token
      await prefs.setString('token', '12356');
      setState(() {
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Scaffold(
        body: Center(
          child: Text(
            'Error connecting to services',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    if (_loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (_showRegisterScreen) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const RegisterPage(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _saveToken();
                  setState(() {
                    _loading = true;
                  });
                },
                child: const Text("Let's go!"),
              ),
            ],
          ),
        ),
      );
    }
    return const Scaffold(
      body: SafeArea(
        child: UserProfilePage(),
      ),
    );
  }
}
