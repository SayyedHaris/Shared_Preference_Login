import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared_preferences_example/loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late String? finalEmail;

 @override
  void initState() {
    // TODO: implement initState


    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
    });


    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Icon(Icons.lock,size: 50,)),
    );
  }
}
