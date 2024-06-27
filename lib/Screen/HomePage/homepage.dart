import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/utils/global.dart';

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
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            //todo ----------------------> Bottom Right Gradient
            Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                    center: Alignment.bottomLeft,
                    radius: 0.765,
                    colors: [
                      Color(0xff5670ff),
                      Color(0xff000206),
                    ]),
              ),
            ),
            //todo ----------------------> Top Left Gradient
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 380,
                width: 380,
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
            //todo ----------------------> Blur Container
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 400, sigmaY: 400),
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            //todo ----------------------> Main Body
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 17, 15, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Plan Your\nPerfect Trip',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'mont',
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.bold)),
                        Container(
                          height: width * 0.15,
                          width: width * 0.15,
                          decoration: BoxDecoration(
                              color: Colors.blue, shape: BoxShape.circle),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.035),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8.5, sigmaY: 8.5),
                        child: Container(
                          height: height * 0.078,
                          width: width,
                          padding: EdgeInsets.fromLTRB(0, 10, 16, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white70.withOpacity(0.12),
                          ),
                          child: TextField(
                            cursorColor: Colors.blue,
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'mont'),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white70,
                                ),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    color: Colors.white70, fontFamily: 'mont'),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.035),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            category.length,
                            (index) => ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 8.5, sigmaY: 8.5),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          14, 9, 14, 9),
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white70.withOpacity(0.12),
                                        border: Border.all(
                                            color: Colors.white12, width: 1.5),
                                      ),
                                      child: Text(
                                        category[index],
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                    ),
                    SizedBox(height: height * 0.035),
                    Wrap(
                      spacing: width * 0.034,
                      children: List.generate(packageList.length, (index) =>
                      (index == 0) ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8.5, sigmaY: 8.5),
                        child: Container(
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white70.withOpacity(0.12),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: height * 0.25,
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    color: Colors.blue,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            packageList[index]['img']),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      packageList[index]['name'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'mont',
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.041),
                                    ),
                                    SizedBox(height: 2),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.currency_rupee,
                                              color: Colors.white,
                                              size: width * 0.044,
                                            ),
                                            Text(
                                              ' ${packageList[index]['price']}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.04,
                                                  fontFamily: 'mont'),
                                            ),
                                            Text(
                                              '  -  ',
                                              style: TextStyle(
                                                color: Colors.grey,),
                                            ),
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                              size: width * 0.044,
                                            ),
                                            Text(
                                              ' ${packageList[index]['location']}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.035,
                                                  fontFamily: 'mont'),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.star_half,color: Colors.amberAccent,
                                                size: width * 0.054),
                                            Text(
                                              ' ${packageList[index]['rate']}',
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: width * 0.037,
                                                  fontFamily: 'mont'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                          : Padding(
                            padding: EdgeInsets.only(top: height *0.03),
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8.5, sigmaY: 8.5),
                              child: Container(
                                width: width / 2.28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white70.withOpacity(0.12),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height * 0.25,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                          color: Colors.blue,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  packageList[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(9,11,9,11),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            packageList[index]['name'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'mont',
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.04),
                                          ),
                                          const SizedBox(height: 2),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    color: Colors.white,
                                                    size: width * 0.044,
                                                  ),
                                                  Text(
                                                    '${packageList[index]['location']}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: (index == 2) ? width * 0.029 : width * 0.035,
                                                        fontFamily: 'mont'),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.star_half,color: Colors.amberAccent,
                                                      size: width * 0.054),
                                                  Text(
                                                    ' ${packageList[index]['rate']}',
                                                    style: TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: width * 0.037,
                                                        fontFamily: 'mont'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.currency_rupee,
                                                color: Colors.white,
                                                size: width * 0.044,
                                              ),
                                              Text(
                                                '${packageList[index]['price']}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.04,
                                                    fontFamily: 'mont'),
                                              ),
                                              Text(
                                                ' /Person',
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: width * 0.032,
                                                    fontFamily: 'mont'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                          )
                      ),
                    ),
                    SizedBox(height: height * 0.115,
                    ),
                  ],
                ),
              ),
            ),
            //todo ----------------------> Bottom Navigation Bar
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8.5, sigmaY: 8.5),
                    child: Container(
                      height: height * 0.085,
                      width: width,
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
                              Navigator.of(context)
                                  .pushNamed('/favoriteQuotes');
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
            ),
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

List category = [
  'All Popular',
  'Mountain',
  'Temple',
  'Beach',
  'Ancient Place',
  'Adventure',
];
//Adventure
// Hiking
// Mountain
// Desert
// City Tours
// Historical Sites
// Wildlife
// Luxury Resorts
// Cultural
// Road Trips
// Cruises
// Islands
// Skiing
// Backpacking
// Wellness Retreats
// Family Friendly
// Romantic Getaways
// Eco-Tourism
// National Parks
// Festivals and Events
