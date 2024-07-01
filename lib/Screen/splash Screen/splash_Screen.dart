import 'dart:async';

import 'package:flutter/material.dart';

import '../TermAndCondition/term_&_Condition_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => TermConditionPage(),));
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: heigth * 0.25,
                child: Image.asset(
                    'assets/images/traveling_logo-removebg-preview.png'),
              ),
              Text('triptrekker',style: TextStyle(color: Colors.white,fontSize: width*0.13,fontWeight: FontWeight.bold,fontFamily: 'mont'),)
            ],
          ),
        ),
      ),
    );
  }
}
