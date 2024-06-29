import 'package:flutter/material.dart';
import 'package:travel_app/Screen/CartPage/carPage.dart';
import 'package:travel_app/Screen/DetailPage/detailPage.dart';
import 'package:travel_app/Screen/HomePage/homepage.dart';
import '../Screen/HomePage/search.dart';
import '../Screen/SignUp/sign-in_page.dart';
import '../Screen/TermAndCondition/term_&_Condition_page.dart';

class Approutes{
  static Map<String, Widget Function(BuildContext)> routes = {
    '/' : (context) => const TermConditionPage(),
    '/home' : (context) => const HomePage(),
    '/detail' : (context) => const DetailPage(),
    '/cart' : (context) => const CartScreen(),
    '/search' : (context) => const SearchScreen(),
  };
}