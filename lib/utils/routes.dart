import 'package:flutter/material.dart';
import 'package:travel_app/Screen/DetailPage/detailPage.dart';
import '../Screen/SignUp/sign-in_page.dart';
import '../Screen/TermAndCondition/term_&_Condition_page.dart';

class Approutes{
  static Map<String, Widget Function(BuildContext)> routes = {
    '/' : (context) => const TermConditionPage(),
    '/cart' : (context) => const DetailPage(),
  };
}