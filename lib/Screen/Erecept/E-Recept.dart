import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:travel_app/Screen/PaymentPage/paymentPage.dart';
import '../../utils/global.dart';
import '../BookingPage/bookingPage.dart';

GlobalKey imgKey = GlobalKey();

class E_Recept extends StatefulWidget {
  const E_Recept({super.key});

  @override
  State<E_Recept> createState() => _E_ReceptState();
}

class _E_ReceptState extends State<E_Recept> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(child:
    Scaffold(
      body: Stack(
        children: [
          background(),
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.038, height * 0.026, width * 0.038, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.arrow_back_ios,color: Colors.white,),
                ),
                Text(
                  'E-Receipt',
                  style: TextStyle(
                      fontSize: width * 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'mont'),
                ),
                GestureDetector(
                  onTap: () async{
                    RenderRepaintBoundary boundary =
                    imgKey
                        .currentContext!
                        .findRenderObject()
                    as RenderRepaintBoundary;
                    ui.Image image =
                    await boundary.toImage();
                    ByteData? byteData =
                    await (image.toByteData(
                        format: ui
                            .ImageByteFormat.png));
                    Uint8List img =
                    byteData!.buffer.asUint8List();
                    ImageGallerySaver.saveImage(img);
                    Fluttertoast.showToast(
                      msg: 'Image Saved To Gallery',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16,
                    );
                  },
                  child: Icon(Icons.download,color: Colors.white,size: width * 0.07,),
                ),
              ],
            ),
          ),
          RepaintBoundary(
            key: imgKey,
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: width * 0.43,
                            width: width * 0.43,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff3492fd).withOpacity(0.4),
                                    blurRadius: 15,
                                    spreadRadius: 25,
                                  ),
                                  const BoxShadow(
                                    color: Color(0xff152a56),
                                    blurRadius: 12,
                                    spreadRadius: 10,
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
                            height: height * 0.047,
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
                              const Icon(Icons.location_on, color: Colors.white70,),
                              Text(
                                '${cartList[bookingIndex]['location']}',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontFamily: 'mont',
                                    fontSize: width * 0.039),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.04,),
                          ListTile(
                            title: Text(
                              ' Start Date',
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontFamily: 'mont',
                                  fontSize: width * 0.04),
                            ),
                            trailing:  Text(
                              Date,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontFamily: 'mont',
                                  fontSize: width * 0.04),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              ' End Date',
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontFamily: 'mont',
                                  fontSize: width * 0.04),
                            ),
                            trailing:  Text(
                              endDate,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontFamily: 'mont',
                                  fontSize: width * 0.04),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              ' Person',
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontFamily: 'mont',
                                  fontSize: width * 0.04),
                            ),
                            trailing:  Text(
                              '${people.toString()} Person',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontFamily: 'mont',
                                  fontSize: width * 0.04),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              ' Total Price',
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontFamily: 'mont',
                                  fontSize: width * 0.04),
                            ),
                            trailing:  Text(
                              '₹ ${total.toString()}',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontFamily: 'mont',
                                  fontSize: width * 0.04),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
                        'Back',
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
    )
    );
  }
}
