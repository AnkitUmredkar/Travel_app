import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel_app/Screen/BookingPage/bookingPage.dart';
import 'package:travel_app/Screen/HomePage/homePage.dart';
import 'package:travel_app/utils/global.dart';
import '../Erecept/E-Recept.dart';

class SuccessPaymentPage extends StatefulWidget {
  const SuccessPaymentPage({super.key});

  @override
  State<SuccessPaymentPage> createState() => _SuccessPaymentPageState();
}

class _SuccessPaymentPageState extends State<SuccessPaymentPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          background(),
          //todo ----------------------> Main Body
          Padding(
            padding: EdgeInsets.only(top: height * 0.15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: width * 0.05,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Booking Success !',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'mont',
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.07),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        'You have successfully created\nyour booking.',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: width * 0.041,
                            fontFamily: 'mont'),
                      ),
                      SizedBox(height: height * 0.01),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: E_Recept(),
                                  type: PageTransitionType.rightToLeft));
                        },
                        child: Text(
                          'View E-Recept',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'mont',
                            fontSize: width * 0.04,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: width * 0.43,
                        width: width * 0.43,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff3492fd).withOpacity(0.4),
                                blurRadius: 25,
                                spreadRadius: 35,
                              ),
                              BoxShadow(
                                color: Color(0xff152a56),
                                blurRadius: 22,
                                spreadRadius: 20,
                              ),
                            ],
                            border: Border.all(
                                strokeAlign: BorderSide.strokeAlignOutside,
                                width: 2.2,
                                color: blueColor),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage(cartList[bookingIndex]['img']),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: height * 0.0485,
                      ),
                      Text(
                        cartList[bookingIndex]['name'],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'mont',
                            fontSize: width * 0.06),
                      ),
                      SizedBox(
                        height: height * 0.012,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on,color: Colors.white70,),
                          Text(
                            '${cartList[bookingIndex]['location']} | ',
                            style: TextStyle(
                                color: Colors.white70,
                                fontFamily: 'mont',
                                fontSize: width * 0.039),
                          ),
                          Icon(Icons.calendar_month_outlined,color: Colors.white70,size: width * 0.05,),
                          Text(
                            ' $Date',
                            style: TextStyle(
                                color: Colors.white70,
                                fontFamily: 'mont',
                                fontSize: width * 0.036),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: HomePage(),
                          type: PageTransitionType.rightToLeft));
                },
                child: Container(
                  height: height * 0.061,
                  width: width * 0.59,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: blueColor,
                  ),
                  child: Center(
                      child: Text(
                    'Explore Home',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.042,
                        fontFamily: 'mont'),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
