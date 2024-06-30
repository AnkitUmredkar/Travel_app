import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:readmore/readmore.dart';
import 'package:travel_app/utils/global.dart';

import '../HomePage/homepage.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void initState(){
    print(showOptionImg.length);
    super.initState();
  }
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
                    radius: 0.765,
                    colors: [
                      Color(0xff5670ff),
                      Color(0xff000206),
                    ]),
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
            Column(
              children: [
                Container(
                  height: height * 0.42,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(img))),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16,19,16,10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                                      color: Colors.black, fontSize: width * 0.04,fontFamily: 'mont'),
                                ),
                              ),
                              Text(
                                showList[selectedIndex]['time'],
                                style: TextStyle(
                                    color: Colors.white60, fontSize: width * 0.04,fontFamily: 'mont'),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.025,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Text(
                                    showList[selectedIndex]['location'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: width * 0.04),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_half,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Text(
                                    showList[selectedIndex]['rate'].toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: width * 0.04,fontFamily: 'mont'),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            showList[selectedIndex]['name'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.07,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'mont'),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          ReadMoreText(
                            showList[selectedIndex]['description'],
                            style: TextStyle(
                              color: Colors.white60, fontSize: width * 0.04,fontFamily: 'mont',),
                            trimLines: 3,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            moreStyle: TextStyle(
                                color: Colors.blue, fontSize: width * 0.04),
                            trimExpandedText: ' Show less',
                            lessStyle: const TextStyle(color: Colors.blue),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                showOptionImg.length,
                                      (index) => GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            img = showOptionImg[index];
                                          });
                                        },
                                        child: Container(
                                          height: height * 0.1,
                                          width: width * 0.24,
                                          margin: EdgeInsets.only(right: width * 0.025),
                                          decoration: BoxDecoration(
                                        color: blueColor,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('${showOptionImg[index]}'),
                                        ),
                                          ),
                                        ),
                                      ),
                                ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.0265,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  '₹ ${showList[selectedIndex]['price'
                                  ].toString()}/-',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.06,
                                    fontFamily: 'mont',),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  bool check = false;
                                  for(int i=0; i<cartList.length; i++){
                                    if(cartList[i]['name'] == showList[selectedIndex]['name']){
                                      check = true;
                                    }
                                  }
                                  if(!check){
                                    cartList.add(showList[selectedIndex]);
                                    Fluttertoast.showToast(
                                      msg: 'Package add to Saved Trips',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      fontSize: 16,
                                    );
                                  }
                                },
                                child: Container(
                                  height: height * 0.072,
                                  width: width * 0.54,
                                  decoration: BoxDecoration(
                                      color: blueColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Save Trip',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: width * 0.05,fontFamily: 'mont'),
                                  ),
                                ),
                              )
                            ],
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

String img = '';
