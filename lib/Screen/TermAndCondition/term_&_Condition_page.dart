import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel_app/Screen/TermAndCondition/page2.dart';
import 'package:travel_app/utils/global.dart';

class TermConditionPage extends StatefulWidget {
  const TermConditionPage({super.key});

  @override
  State<TermConditionPage> createState() => _TermConditionPageState();
}

class _TermConditionPageState extends State<TermConditionPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: heigth,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/images/SplashScreenImages/ELLA, SRI LANKA_ 13 Incredible Things To Do In Ella _ The Common Wanderer.jpg'),
                ),
              ),
            ),
            Container(
              height: heigth,
              width: width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black87,
                        Colors.transparent,
                      ])),
            ),
            Container(
              height: heigth,
              width: width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black87,
                        Colors.transparent,
                      ])),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25,25,25,12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Where do\nyou want to discover?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.1,
                        fontFamily: 'arial',
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'At Friend tours and trave, we customize reliable and trutworthy education tours  to',
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: width * 0.048,
                        fontFamily: 'arial',
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: Page2(),
                              type: PageTransitionType.rightToLeft));
                    },
                    child: Container(
                      height: heigth * 0.075,
                      width: width,
                      margin: EdgeInsets.only(top: 25),
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.06,
                            fontFamily: 'arial'),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
