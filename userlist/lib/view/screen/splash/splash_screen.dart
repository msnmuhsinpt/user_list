import 'package:flutter/material.dart';
import 'package:userlist/view/widget/app_text_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //call intial
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: appTextView(name: 'Splash Page', isBold: true),
      ),
    );
  }

  void init() {
    Future.delayed(
      const Duration(seconds: 3),
      () =>
          Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false),
    );
  }
}
