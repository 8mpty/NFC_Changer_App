import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _openNfcAndExit();
  }

  Future<void> _openNfcAndExit() async {
    try {
      final intent = AndroidIntent(
        action: 'android.settings.NFC_SETTINGS',
        flags: [Flag.FLAG_ACTIVITY_NEW_TASK],
      );
      
      await intent.launch();
    } catch (e) {
      // Ignore errors, just exit
    } finally {
      Future.delayed(const Duration(milliseconds: 10), () {
        SystemNavigator.pop(animated: false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(),
    );
  }
}