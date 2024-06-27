import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel_app/Screen/TermAndCondition/page3.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: heigth * 1,
              width: width * 1,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/images/SplashScreenImages/image4.jpg'),
                ),
              ),
            ),
            Container(
              height: heigth * 1,
              width: width * 1,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ])),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: heigth * 0.5,
                width: width * 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    children: [
                      Text(
                        "It's a big world out there go explore",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.12,
                            fontFamily: 'mont',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'To get the best of your adventure\n you just need to leave and go where you like. ',
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: width * 0.05,
                            fontFamily: 'mont',
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, right: 8),
                        child:InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: Page3(),
                                    type: PageTransitionType.rightToLeft));
                          },
                          child: Container(
                            height: heigth * 0.08,
                            width: width * 1,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            child: Text('Next',style: TextStyle(color: Colors.white,fontSize: width*0.07,letterSpacing: 1),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
