import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import '../../utils/global.dart';
import '../DetailPage/detailPage.dart';
import '../HomePage/homePage.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            background(),
            //todo -----------------> AppBar
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.038, height * 0.085, width * 0.038, height * 0.01),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const HomePage(),
                              type: PageTransitionType
                                  .rightToLeft));
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: width * 0.25),
                  Text(
                    'Favorites Trip',
                    style: TextStyle(
                        fontSize: width * 0.05,
                        color: Colors.white,
                        fontFamily: 'mont'),
                  ),
                ],
              ),
            ),
            //todo -----------------> Body
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.038, height * 0.09, width * 0.038, height * 0.01),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.03,
                    ),
                    ...List.generate(favoriteList.length, (index) => GestureDetector(
                    onTap: () {
                      selectedIndex = index;
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const DetailPage(),
                              type: PageTransitionType
                                  .rightToLeft));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: height * 0.025),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 8.5, sigmaY: 8.5),
                            child: Container(
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(20),
                                color: Colors.white70
                                    .withOpacity(0.12),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: height * 0.26,
                                    width: width,
                                    alignment: Alignment.topRight,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        const BorderRadius.only(
                                          topLeft:
                                          Radius.circular(20),
                                          topRight:
                                          Radius.circular(20),
                                        ),
                                        color: blueColor,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                favoriteList[index]
                                                ['img']),
                                            fit: BoxFit.cover)),
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                            for(int i=0; i<packageList.length; i++)
                                              for(int j=0; j<packageList[i].length; j++){
                                                if(packageList[i][j]['name'] == favoriteList[index]['name']){
                                                  likeList[i][j] = false;
                                                  showLike[j] = likeList[i][j];
                                                  break;
                                                }
                                              }
                                            favoriteList.removeAt(index);
                                            Fluttertoast.showToast(
                                              msg: 'Remove From Favorites',
                                              toastLength:
                                              Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              fontSize: 16,
                                            );

                                        });
                                      },
                                      child: Container(
                                        height: width * 0.086,
                                        width: width * 0.086,
                                        margin: EdgeInsets.all(width * 0.025),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.5),
                                            shape: BoxShape.circle
                                        ),
                                        child: const Icon(Icons.favorite_rounded,color: Colors.red,),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.all(14),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          favoriteList[index]['name'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'mont',
                                              fontWeight:
                                              FontWeight.bold,
                                              fontSize:
                                              width * 0.041),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.currency_rupee,
                                                  color: Colors.white,
                                                  size: width * 0.044,
                                                ),
                                                Text(
                                                  ' ${favoriteList[index]['price']}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.04,
                                                      fontFamily:'mont'),
                                                ),
                                                const Text(
                                                  '  -  ',
                                                  style: TextStyle(
                                                    color:
                                                    Colors.grey,
                                                  ),
                                                ),
                                                Icon(Icons.location_on,
                                                  color: Colors.white,
                                                  size: width * 0.044,
                                                ),
                                                Text(
                                                  ' ${favoriteList[index]['location']}',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .white,
                                                      fontSize:
                                                      width *
                                                          0.035,
                                                      fontFamily:
                                                      'mont'),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                    Icons.star_half,
                                                    color: Colors
                                                        .amberAccent,
                                                    size: width *
                                                        0.054),
                                                Text(
                                                  ' ${favoriteList[index]['rate']}',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .white70,
                                                      fontSize:
                                                      width *
                                                          0.037,
                                                      fontFamily:
                                                      'mont'),
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
                          )),
                    ),
                  ))],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


List favoriteList = [];