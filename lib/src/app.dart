import 'package:flutter/material.dart';
import 'package:veil/src/pages/profile.dart';
import 'package:veil/src/pages/register.dart';
import 'package:veil/utils/auth/auth.dart' as auth;

class App extends StatelessWidget {
  const App({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veil',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Color.fromARGB(255, 201, 192, 236),
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return const Scaffold(
        body: Center(
          child: Text(
            'Error connecting to services.',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    if (_loading) {
      return const Scaffold(
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
                onPressed: () async {
                  try {
                    setState(() {
                      _loading = true;
                    });
                    var storedToken = await auth.findTokenOnDevice();

                    //validate the stored token
                    print('found token in device(${storedToken}), validating it.');
                  }
                  on Exception catch (_, e) {
                    setState(() { _loading = true; });
                  }
                },
                child: const Text("Login As New User!"),
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
