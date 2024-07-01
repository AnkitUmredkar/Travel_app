
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel_app/utils/global.dart';

import '../SuccessPaymentPage/paymentSuccessPage.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  void selectedPay(Object? e ) => setState(() {
    pay = e as int;
  });
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            background(),
            //todo -----------------> AppBar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: width * 0.18),
                  Text(
                    'Payment Method',
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
              padding: EdgeInsets.fromLTRB(16, height * 0.09, 16, 10),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Container(
                    height: height * 0.068,
                    width: width,
                    padding: EdgeInsets.only(right: width * 0.015),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white70.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8),
                      border: pay==1 ? Border.all(
                        color: Colors.white,
                        width: 2,
                      ) : Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 1,
                              groupValue: pay,
                              onChanged: (value) {
                                setState(() {
                                  pay = value!;
                                });
                              },
                              activeColor: Colors.white,
                            ),
                            Text(
                                'Amazon Pay',
                                style: pay==1 ? TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'mont',
                                    fontSize: height * 0.023,color: Colors.white)
                                    : TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'mont',
                                    fontSize: height * 0.023,color: Colors.white70)
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/PaymentImages/amazon.png',
                          height: height * 0.062,
                          width: width * 0.27,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.018,
                  ),
                  Container(
                    height: height * 0.068,
                    width: width,
                    padding: EdgeInsets.only(right: width * 0.015),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white70.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8),
                      border: pay==2 ? Border.all(
                        color: Colors.white,
                        width: 2,
                      ) : Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 2,
                              groupValue: pay,
                              onChanged: (value) {
                                setState(() {
                                  pay = value!;
                                });
                              },
                              activeColor: Colors.white,
                            ),
                            Text(
                                'Credit Card',
                                style: pay==2 ? TextStyle(
                                    fontWeight: FontWeight.w500, fontFamily: 'mont',
                                    fontSize: height * 0.023,color: Colors.white) : TextStyle(
                                    fontWeight: FontWeight.w500,fontFamily: 'mont',
                                    fontSize: height * 0.023,color: Colors.white70)
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/PaymentImages/visaa.png',
                          height: height * 0.062,
                          width: width * 0.27,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.018,
                  ),
                  Container(
                    height: height * 0.068,
                    width: width,
                    padding: EdgeInsets.only(right: width * 0.015),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white70.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8),
                      border: pay==3 ? Border.all(
                        width: 2,
                        color: Colors.white,
                      ) : Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 3,
                              groupValue: pay,
                              onChanged: (value) {
                                setState(() {
                                  pay = value!;
                                });
                              },
                              activeColor: Colors.white,
                            ),
                            Text(
                                'Paypal',
                                style: pay==3 ? TextStyle(
                                    fontWeight: FontWeight.w500,fontFamily: 'mont',
                                    fontSize: height * 0.023,color: Colors.white) : TextStyle(
                                    fontWeight: FontWeight.w500,fontFamily: 'mont',
                                    fontSize: height * 0.023,color: Colors.white70)
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/PaymentImages/paypal.png',
                          height: height * 0.062,
                          width: width * 0.27,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.018,
                  ),
                  Container(
                    height: height * 0.068,
                    width: width,
                    padding: EdgeInsets.only(right: width * 0.015),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white70.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8),
                      border: pay==4 ? Border.all(
                        color: Colors.white,
                        width: 2,
                      ) : Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 4,
                              groupValue: pay,
                              onChanged: (value) {
                                setState(() {
                                  pay = value!;
                                });
                              },
                              activeColor: Colors.white,
                            ),
                            Text(
                                'Google Pay',
                                style: pay==4 ? TextStyle(
                                    fontWeight: FontWeight.w500,fontFamily: 'mont',
                                    fontSize: height * 0.023,color: Colors.white) : TextStyle(
                                    fontWeight: FontWeight.w500,fontFamily: 'mont',
                                    fontSize: height * 0.023,color: Colors.white70)
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/PaymentImages/gpay.png',
                          height: height * 0.062,
                          width: width * 0.27,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub-Total',
                        style: TextStyle(
                          fontFamily: 'mont',
                            color: Colors.white70,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '₹ ${(cartList[bookingIndex]['price'] * people).toString()}.0',
                        style: TextStyle(
                            fontFamily: 'mont',color: Colors.white70 ,fontSize: width * 0.045, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping Fee',
                        style: TextStyle(
                            fontFamily: 'mont',
                            color: Colors.white70,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '₹ ${((cartList[bookingIndex]['price'] * people) * 10/100).toString()}',
                        style: TextStyle(
                            fontSize: width * 0.045,fontFamily: 'mont',color: Colors.white70 ,fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Divider(color: Colors.grey, thickness: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Payment',
                        style: TextStyle(
                            fontFamily: 'mont',
                            color: Colors.white,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '₹ ${total.toString()}',
                        style: TextStyle(
                            fontFamily: 'mont',
                            color: Colors.white,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                PageTransition(
                    child: const SuccessPaymentPage(),
                    type: PageTransitionType
                        .fade));
          },
          child: Container(
            height: height * 0.065,
            margin: EdgeInsets.only(left: width * 0.074),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: Text(
              'Confirm Booking',
              style: TextStyle(
                  fontFamily: 'mont',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.048),
            ),
          ),
        ),
      ),
    );
  }
}

late double total ;
int pay = 1;
int subTotal = 0;