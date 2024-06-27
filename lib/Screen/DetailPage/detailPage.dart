import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../HomePage/homepage.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
            Column(
              children: [
                Container(
                  height: height * 0.43,
                  width: width,
                  decoration:const  BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/HOT3.jpg'))),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: height * 0.03,
                                  width: width * 0.19,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Open',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: width * 0.04),
                                  ),
                                ),
                                Text(
                                  '2:00 AM - 11:59 PM',
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: width * 0.04),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.025,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Text(
                                      'Turkey',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: width * 0.04),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: width * 0.04),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: Text(
                              'Cappadocia Air Ballon',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.075,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: ReadMoreText(
                              'The natural wonders of Cappadocia are even more impressive when viewed from the air and a hot air balloon',
                              style: TextStyle(color: Colors.white60,fontSize: width*0.05),
                              trimLines: 3,
                              textAlign: TextAlign.justify,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'See more',
                              moreStyle: TextStyle(
                                  color: Colors.blue,fontSize:width*0.045),
                              trimExpandedText: ' See less',
                              lessStyle:  TextStyle(
                                  color: Colors.blue,fontSize:width*0.045),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...List.generate(
                                  5,
                                      (index) => Container(
                                    margin: const EdgeInsets.all(5),
                                    height: height * 0.1,
                                    width: width * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.025,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₹ 200",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.08,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: height * 0.08,
                                  width: width * 0.55,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Book Now',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: width * 0.07),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
