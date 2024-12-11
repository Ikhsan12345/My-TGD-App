import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './beranda.dart';
import './akademik.dart';
import './pembayaran.dart';
import './profile.dart';
import 'get_started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool _isFirstLaunch = true;

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyTGD App',
      initialRoute: _isFirstLaunch ? '/getstarted' : '/beranda',
      routes: {
        '/beranda': (context) => const Beranda(),
        '/getstarted': (context) => GetStarted(onGetStartedCompleted: _setFirstLaunchStatus),
        '/akademik': (context) => const Akademik(),
        '/pembayaran': (context) => const Pembayaran(),
        '/profil': (context) => const Profil(),
      },
    );
  }

  _setFirstLaunchStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstLaunch', false);
  }
}