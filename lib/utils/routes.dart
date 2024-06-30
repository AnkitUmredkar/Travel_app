import 'package:flutter/material.dart';
import 'package:travel_app/Screen/BookingPage/bookingPage.dart';
import '../Screen/CartPage/cartPage.dart';
import '../Screen/HomePage/homePage.dart';
import '../Screen/PaymentPage/paymentPage.dart';
import '../Screen/SearchPage/search.dart';
import '../Screen/SignUp/sign-in_page.dart';
import '../Screen/TermAndCondition/term_&_Condition_page.dart';

class Approutes{
  static Map<String, Widget Function(BuildContext)> routes = {
    '/' : (context) => const TermConditionPage(),
  };
}