import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel_app/Screen/BookingPage/bookingPage.dart';
import 'package:travel_app/utils/global.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            background(),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.038, height * 0.026, width * 0.038, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_ios,color: Colors.white,),
                  ),
                  SizedBox(
                    width: width * 0.25,
                  ),
                  Text(
                    'Saved Trips',
                    style: TextStyle(
                        fontSize: width * 0.05,
                        color: Colors.white,
                        fontFamily: 'mont'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.038, height * 0.085, width * 0.038, height * 0.01),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.03,
                  ),
                  ...List.generate(
                    cartList.length,
                        (index) => Container(
                      height: height * 0.175,
                      width: width,
                      padding: const EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: height * 0.03),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white70.withOpacity(0.12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(cartList[index]['img']),
                                    fit: BoxFit.cover),
                                color: blueColor),
                          ),
                          SizedBox(width: width * 0.025),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        cartList[index]['name'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'mont',
                                            fontWeight: FontWeight.bold,
                                            fontSize: width * 0.0394),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              cartList.removeAt(index);
                                            });
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          )),
                                    ],
                                  ),
                                  // SizedBox(height: height * 0.003),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white70,
                                        size: width * 0.045,
                                      ),
                                      Text(
                                        cartList[index]['location'],
                                        style: TextStyle(
                                            fontSize: width * 0.036,
                                            color: Colors.white70,
                                            fontFamily: 'mont'),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(height: height * 0.0025),
                                  Row(
                                    children: [
                                      Text(
                                          '₹ ${cartList[index]['price'].toString()}',
                                          style: TextStyle(
                                              fontSize: width * 0.035,
                                              color: Colors.blue,
                                              fontFamily: 'mont')),
                                      Text(' /Person ',
                                          style: TextStyle(
                                              fontSize: width * 0.035,
                                              color: Colors.white70,
                                              fontFamily: 'mont')),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          bookingIndex = index;
                                          people = 1;
                                          TextEditingController txtName = TextEditingController();
                                          ctrlList = [txtName];
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  child: const BookingPage(),
                                                  type: PageTransitionType
                                                      .fade));
                                        },
                                        child: Container(
                                          height: height * 0.045,
                                          width: width * 0.3,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius:
                                              BorderRadius.circular(50)),
                                          child: const Text(
                                            'Book Now',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'mont'),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.star_half,
                                            color: Colors.amber,
                                            size: width * 0.048,
                                          ),
                                          Text(
                                              ' ${cartList[index]['rate']}'
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'mont',
                                                  fontSize: width * 0.035)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
