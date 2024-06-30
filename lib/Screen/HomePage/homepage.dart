import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel_app/Screen/CartPage/cartPage.dart';
import 'package:travel_app/Screen/DetailPage/detailPage.dart';
import 'package:travel_app/Screen/FavoritePage/favoritePage.dart';
import 'package:travel_app/SettingPage/settingPage.dart';
import 'package:travel_app/utils/global.dart';

import '../SearchPage/search.dart';
import '../UserProfile/userProfile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState(){
    setState(() {});
    Timer(const Duration(seconds: 2), () {
      setState(() {
        isBuffer = true;
      });
    });
    super.initState;
  }
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
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.fromLTRB(width * 0.032, height * 0.02, width * 0.032, 0),
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
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const UserProfile(),
                                    type: PageTransitionType
                                        .fade));
                          },
                          child: Container(
                            height: width * 0.165,
                            width: width * 0.165,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  width: 1.5,
                                  color: Colors.white
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.white70,
                              radius: width * 0.165,
                              backgroundImage:
                              (fileImage != null) ? FileImage(fileImage!) : null,
                              child: (fileImage == null)
                                  ? Center(
                                  child: Icon(Icons.person,color: Colors.grey,size: width *0.13,)
                              )
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.035),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8.5, sigmaY: 8.5),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const SearchScreen(),
                                    type: PageTransitionType
                                        .fade));
                          },
                          child: Container(
                            height: height * 0.078,
                            width: width,
                            padding: const EdgeInsets.fromLTRB(0, 10, 16, 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white70.withOpacity(0.12),
                            ),
                            child: AbsorbPointer(
                              absorbing: true,
                              child: TextField(
                                cursorColor: Colors.blue,
                                style: const TextStyle(
                                    color: Colors.white, fontFamily: 'mont'),
                                decoration: const InputDecoration(
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
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      checkIndex = index;
                                      isBuffer = false;
                                      showList = packageList[index];
                                      checkCategory = category[index];
                                      showLike = likeList[index];
                                    });
                                    Timer(const Duration(milliseconds: 30), () {
                                      setState(() {
                                        isBuffer = true;
                                      });
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        14, 9, 14, 9),
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: (checkIndex == index) ? Colors.white : Colors.white70.withOpacity(0.12),
                                      border: (checkIndex == index) ? null : Border.all(
                                          color: Colors.white12, width: 1.5),
                                    ),
                                    child: Text(
                                      category[index],
                                      style: TextStyle(
                                          color: (checkIndex == index) ? Colors.black : Colors.grey,
                                          fontFamily: 'mont',
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(height: height * 0.035),
                    (!isBuffer)
                        ? Padding(
                      padding: const EdgeInsets.only(top: 130),
                      child: CircularProgressIndicator(
                        color: blueColor,
                      ),
                    )
                        : Wrap(
                      spacing: width * 0.031,
                      children: List.generate(
                          showList.length,
                              (index) => (index == 0)
                              ? GestureDetector(
                            onTap: () {
                              selectedIndex = index;
                              img = showList[index]['img'];
                              showOptionImg = optionImgList[checkIndex][index];
                              if(!showOptionImg.contains(showList[index]['img'])){
                                showOptionImg.add(showList[index]['img']);
                              }
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
                                                        showList[index]
                                                        ['img']),
                                                    fit: BoxFit.cover)),
                                            child: GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  showLike[index] = !showLike[index];
                                                  if (showLike[index]) {
                                                    favoriteList.add(
                                                        showList[index]
                                                    );
                                                    Fluttertoast.showToast(
                                                      msg: 'Add To Favorites',
                                                      toastLength:
                                                      Toast.LENGTH_SHORT,
                                                      gravity: ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor: Colors.black,
                                                      textColor: Colors.white,
                                                      fontSize: 16,
                                                    );
                                                  } else {
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
                                                  }
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
                                                child: Icon(
                                                    (showLike[index] == true)
                                                        ? Icons.favorite_rounded
                                                        : Icons
                                                        .favorite_border_rounded,
                                                    color: (showLike[index] == true)
                                                        ? Colors.red
                                                        : Colors.white),
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
                                                  showList[index]['name'],
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
                                                          ' ${showList[index]['price']}',
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
                                                          ' ${showList[index]['location']}',
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
                                                          ' ${showList[index]['rate']}',
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
                          )
                              : GestureDetector(
                            onTap: () {
                              selectedIndex = index;
                              img = showList[index]['img'];
                              showOptionImg = optionImgList[checkIndex][index];
                              if(!showOptionImg.contains(showList[index]['img'])){
                                showOptionImg.add(showList[index]['img']);
                              }
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const DetailPage(),
                                      type: PageTransitionType
                                          .rightToLeft));
                            },
                            child: Padding(
                              padding: (index != 0 && index % 2 == 0) ?EdgeInsets.only(left:  width * 0.0085): const EdgeInsets.all(0) ,
                              child: Padding(
                                padding: EdgeInsets.only(bottom:  height * 0.0225),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 8.5, sigmaY: 8.5),
                                      child: Container(
                                        width: width / 2.27,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: Colors.white70
                                              .withOpacity(0.12),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: height * 0.25,
                                              alignment: Alignment.topRight,
                                              decoration: BoxDecoration(
                                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),
                                                  ),
                                                  color: blueColor,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          showList[index]
                                                          ['img']),
                                                      fit: BoxFit.cover)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    showLike[index] = !showLike[index];
                                                    if (showLike[index]) {
                                                      // likedQuotesList.add({
                                                      //   'quotes':
                                                      //   showQuotesList[index]
                                                      //   ['quotes'],
                                                      //   'category':
                                                      //   showQuotesList[index]
                                                      //   ['category']
                                                      // // });
                                                      // likedQuotesImg
                                                      //     .add(showImages[index]);
                                                      favoriteList.add(
                                                          showList[index]
                                                      );
                                                      Fluttertoast.showToast(
                                                        msg: 'Add To Favorites',
                                                        toastLength:
                                                        Toast.LENGTH_SHORT,
                                                        gravity: ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor: Colors.black,
                                                        textColor: Colors.white,
                                                        fontSize: 16,
                                                      );
                                                    } else {
                                                      // for(int i=0; i<likedQuotesList.length; i++){
                                                      //   if(showQuotesList[index]['quotes'] == likedQuotesList[i]['quotes']){
                                                      //     likedQuotesList.removeAt(i);
                                                      //     likedQuotesImg.removeAt(i);
                                                      //     favKeyList.removeAt(i);
                                                      //   }
                                                      // }
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
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  height: width * 0.086,
                                                  width: width * 0.086,
                                                  margin: EdgeInsets.all(width * 0.022),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black.withOpacity(0.5),
                                                      shape: BoxShape.circle
                                                  ),
                                                  child: Icon(
                                                      (showLike[index] == true)
                                                          ? Icons.favorite_rounded
                                                          : Icons
                                                          .favorite_border_rounded,
                                                      color: (showLike[index] == true)
                                                          ? Colors.red
                                                          : Colors.white),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.fromLTRB(
                                                  9, 11, 9, 11),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    showList[index]['name'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'mont',
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: width * 0.04),
                                                  ),
                                                  const SizedBox(height: 2),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        color: Colors.white,
                                                        size: width * 0.044,
                                                      ),
                                                      Text(
                                                        ' ${showList[index]['location']}',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: width * 0.0325,
                                                            fontFamily:
                                                            'mont'),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .currency_rupee,
                                                            color: Colors.white,
                                                            size: width * 0.044,
                                                          ),
                                                          Text(
                                                            ' ${showList[index]['price']}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                width *
                                                                    0.039,
                                                                fontFamily:
                                                                'mont'),
                                                          ),
                                                          Text(
                                                            '/Per.',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white70,
                                                                fontSize:
                                                                width *
                                                                    0.032,
                                                                fontFamily:
                                                                'mont'),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                              Icons
                                                                  .star_half,
                                                              color: Colors
                                                                  .amberAccent,
                                                              size: width *
                                                                  0.054),
                                                          Text(
                                                            ' ${showList[index]['rate']}',
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
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: height * 0.115),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const CartScreen(),
                                      type: PageTransitionType
                                          .fade));
                            },
                            child: bottomButton(
                                width, Icons.travel_explore_rounded, 'Saved'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const FavoritePage(),
                                      type: PageTransitionType
                                          .fade));
                            },
                            child: bottomButton(
                                width, Icons.favorite_rounded, 'Favorite'),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: const SettingPage(),
                                        type: PageTransitionType
                                            .fade));
                              },
                          child: bottomButton(width, Icons.settings, 'Setting')),
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
  'Nature & Wildlife',
  'Foreign',
  'Family Vacation',
];
int checkIndex = 0;
String checkCategory = 'All Popular';
bool isBuffer = false;
List likeList = [
  List.generate(packageList[0].length,(index) => false),
  List.generate(packageList[1].length,(index) => false),
  List.generate(packageList[2].length,(index) => false),
  List.generate(packageList[3].length,(index) => false),
  List.generate(packageList[4].length,(index) => false),
  List.generate(packageList[5].length,(index) => false),
  List.generate(packageList[6].length,(index) => false),
  List.generate(packageList[7].length,(index) => false),
],showLike = List.generate(packageList[0].length,(index) => false);

