import 'package:flutter/material.dart';
import 'package:travel_app/Screen/TermAndCondition/page2.dart';
import 'package:travel_app/Screen/TermAndCondition/page3.dart';
import '../Screen/SignUp/sign-in_page.dart';
import '../Screen/TermAndCondition/term_&_Condition_page.dart';

class Approutes{
  static Map<String, Widget Function(BuildContext)> routes = {
    '/' : (context) => const TermConditionPage(),
    '/page2' : (context) =>  Page2(),
    '/page3' : (context) =>  Page3(),
  };
}