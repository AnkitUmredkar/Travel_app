import 'package:flutter/material.dart';

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
              height: heigth * 1,
              width: width * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/images/SplashScreenImages/ELLA, SRI LANKA_ 13 Incredible Things To Do In Ella _ The Common Wanderer.jpg'),
                ),
              ),
            ),
            Container(
              height: heigth * 1,
              width: width * 1,
              decoration: BoxDecoration(
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
                        'Life is\nshort and the world is wide',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.12,
                            fontFamily: 'mont',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'At Friend tours and trave, we customize reliable and trutworthy education tours  to',
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: width * 0.05,
                            fontFamily: 'mont',
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, right: 8),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/page2');
                          },
                          child: Container(
                            height: heigth * 0.08,
                            width: width * 1,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            child: Text('Get Started',style: TextStyle(color: Colors.white,fontSize: width*0.06),),
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
