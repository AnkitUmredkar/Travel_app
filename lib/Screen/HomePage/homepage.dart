import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff000206),
        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        // ),
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
                decoration: BoxDecoration(
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
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8.5, sigmaY: 8.5),
                  child: Container(
                    height: height * 0.085,
                    width: width,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white70.withOpacity(0.12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        bottomButton(width, Icons.home, 'Home'),
                        GestureDetector(
                          onTap: () {},
                          child: bottomButton(
                              width, Icons.shopping_cart, 'Cart'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/favoriteQuotes');
                          },
                          child: bottomButton(
                              width, Icons.favorite_rounded, 'Favorite'),
                        ),
                        bottomButton(width, Icons.settings, 'Setting'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Column bottomButton(double width, var icon, String data) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: (icon == Icons.home) ? const Color(0xffFE9500) : Colors.white,
        size: width * 0.072,
      ),
      Text(
        data,
        style: TextStyle(
            color: Colors.white, fontSize: width * 0.038, fontFamily: 'gc'),
      ),
    ],
  );
}
