
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veil/src/pages/home.dart';
import 'package:veil/src/pages/register.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veil',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFF151026)
      ),
      home: MyHomePage(title: 'Veil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  bool showRegisterScreen = false;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void showRegisterScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    setState(() {
      widget.showRegisterScreen = (token == null);
    });
  }

  void saveToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // make network call here to get token
    prefs.setString('token', "12356");
  }

  @override
  void initState() {
    super.initState();
    showRegisterScreen();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showRegisterScreen) {
      return Scaffold(
      body: const SafeArea(child: RegisterPage(),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(onPressed: () => {
          saveToken(),
          Navigator.pop(context), //clearing the stack(bug: find better way)
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        ),
        },child: const Center(child: Text("Let's go!"))
        ),
      ),
    );
    }
    return const Scaffold(
      body: SafeArea(child: Home(),),
    );
  }
}
