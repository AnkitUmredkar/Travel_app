import 'package:flutter/material.dart';
import 'package:travel_app/Screen/splash%20Screen/splash_Screen.dart';
import '../Screen/TermAndCondition/term_&_Condition_page.dart';

class Approutes{
  static Map<String, Widget Function(BuildContext)> routes = {
    '/' : (context) => const SplashScreen(),
  };
}