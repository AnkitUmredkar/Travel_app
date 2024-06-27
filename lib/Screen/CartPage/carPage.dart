import 'dart:ui';

import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                    center: Alignment.bottomLeft,
                    radius: 0.75,
                    colors: [
                      Color(0xff5670ff),
                      Color(0xff000206),
                    ]),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 320,
                width: 320,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                      center: Alignment.topRight,
                      radius: 0.75,
                      colors: [
                        Color(0xff5670ff),
                        Color(0xff000206),
                      ]),
                ),
              ),
            ),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 250, sigmaY: 250),
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.black12.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            Container(
              height: height,
              width: width,
            )
          ],
        ),
      ),
    );
  }
}
