import 'package:flutter/material.dart';

import 'login/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(
            "https://img.freepik.com/free-vector/pin-map-logo_1043-275.jpg?w=1480&t=st=1686939635~exp=1686940235~hmac=4144b1c75ba096056e4864f9a839fb519892b2dde780f456340de9d5e9f82b91"),
      ),
    ));
  }
}
