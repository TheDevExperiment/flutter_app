import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veil/src/pages/profile.dart';
import 'package:veil/src/pages/register.dart';

class App extends StatelessWidget {
  const App({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veil',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFF151026),
      ),
      home: const MyHomePage(title: 'Veil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showRegisterScreen = false;

  void _checkToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    setState(() {
      _showRegisterScreen = token == null;
    });
  }

  void _saveToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // make network call here to get token
    await prefs.setString('token', '12356');
  }

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  @override
  Widget build(BuildContext context) {
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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const UserProfilePage()),
                    (route) => false,
                  );
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
