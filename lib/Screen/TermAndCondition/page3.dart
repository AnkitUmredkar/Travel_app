import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel_app/Screen/SignUp/sign-in_page.dart';

import '../../utils/global.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      AssetImage('assets/images/SplashScreenImages/image5.jpg'),
                ),
              ),
            ),
            Container(
              height: heigth,
              width: width,
              decoration: const BoxDecoration(
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
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                    Colors.black87,
                    Colors.transparent,
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "People don't take trips take pepole",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.1,
                        fontFamily: 'arial',
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'To get the best of your adventure\n you just need to leave and go where you like.',
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
                              child: const SignInPage(),
                              type: PageTransitionType.rightToLeft));
                    },
                    child: Container(
                      height: heigth * 0.075,
                      width: width,
                      margin: const EdgeInsets.only(top: 25),
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Next',
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
