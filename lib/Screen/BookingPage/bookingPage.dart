
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readmore/readmore.dart';
import 'package:travel_app/Screen/PaymentPage/paymentPage.dart';
import 'package:travel_app/utils/global.dart';

String Date = 'Start Date';
String endDate = 'End Date';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  void initState(){
    people = 1;
    Date = 'Start Date';
    endDate = 'End Date';
    super.initState();
  }
  void update(){
    setState(() {
      for(int i=0; i<people-ctrlList.length; i++){
        TextEditingController txtName = TextEditingController();
        ctrlList.add(txtName);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formKey,
          child: Stack(
            children: [
              background(),
              //todo -----------------> AppBar
              Padding(
                padding: EdgeInsets.fromLTRB(width * 0.038, height * 0.026, width * 0.038, 0),
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
                    SizedBox(width: width * 0.255),
                    Text(
                      'Book Trip',
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
                padding: EdgeInsets.fromLTRB(width * 0.038, height * 0.1, width * 0.038, height * 0.09),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: height * 0.115,
                                    width: width * 0.245,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(cartList[bookingIndex]['img']),
                                        fit: BoxFit.cover
                                      ),
                                        borderRadius: BorderRadius.circular(15),
                                        color: blueColor),
                                  ),
                                ],
                              ),
                              SizedBox(width: width * 0.035),
                              Expanded(
                                child: SizedBox(
                                  width: width * 0.6,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Day Trip to',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'mont',
                                              fontSize: width * 0.038,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${cartList[bookingIndex]['name']} (Guided Fullday Sightseeing Tour From ${cartList[bookingIndex]['location']})',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'mont',
                                              fontSize: width * 0.038,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              cartList[bookingIndex]['price']
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'mont',
                                                  fontSize: width * 0.038,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              ' / per Person',
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontFamily: 'mont',
                                                  fontSize: width * 0.038,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star_half,
                                              color: Colors.amber,
                                            ),
                                            Text(
                                              ' ${cartList[bookingIndex]['rate']}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'mont',
                                                  fontSize: width * 0.038,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: height * 0.016),
                                        ReadMoreText(
                                          "Traveling involves exploring new places, experiencing different cultures, and stepping out of your daily routine. It's an opportunity to visit destinations you've always dreamed of, from bustling cities to serene landscapes. Whether it's a weekend getaway or a long-term adventure, traveling offers the chance to meet new people, taste diverse cuisines, and create unforgettable memories. It broadens your perspective, enhances your understanding of the world, and often brings a sense of rejuvenation and inspiration.",
                                          style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: width * 0.038,
                                            fontFamily: 'mont',
                                          ),
                                          trimLines: 4,
                                          trimMode: TrimMode.Line,
                                          trimCollapsedText: 'Show more',
                                          moreStyle: TextStyle(
                                              color: Colors.blue,
                                              fontSize: width * 0.038),
                                          trimExpandedText: ' Show less',
                                          lessStyle:
                                              const TextStyle(color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Divider(color: Colors.white24),
                      SizedBox(height: height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() async {
                                DateTime? datePicked = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2001),
                                  initialDate: DateTime.now(),
                                  lastDate: DateTime.now(),
                                  builder: (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.dark().copyWith(
                                        colorScheme: ColorScheme.dark(
                                          primary: blueColor,
                                          onPrimary: Colors.white,
                                          surface: bgColor,
                                          onSurface: Colors.white,
                                        ),
                                        dialogBackgroundColor: Colors.black54,
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (datePicked != null) {
                                  Date = '${datePicked.day.toString().padLeft(2, '0')}/${datePicked.month.toString().padLeft(2, '0')}/${datePicked.year.toString().padLeft(2, '0')}';
                                  setState(() {});
                                }
                              });
                            },
                            child: Container(
                              height: height * 0.062,
                              width: width / 1.6,
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: width * 0.05),
                              margin: EdgeInsets.only(right: width * 0.045),
                              decoration: BoxDecoration(
                                  color: Colors.white70.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular((50)),
                                  border: Border.all(
                                      color: Colors.white38, width: 1.5)),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.white70,
                                  ),
                                  Text(
                                    '  $Date',
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontFamily: 'mont'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(builder: (BuildContext context,
                                          StateSetter setState){
                                        return AlertDialog(
                                          backgroundColor: bgColor,
                                          contentPadding: const EdgeInsets.fromLTRB(20,25,20,25),
                                          content: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    people++;
                                                  });
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 35,
                                                  width: 35,
                                                  decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: const Icon(Icons.add),
                                                ),
                                              ),
                                              Text(
                                                '$people',
                                                style: TextStyle(
                                                    fontSize: width * 0.05,
                                                    color: Colors.white,
                                                    fontFamily: 'mont'),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (people > 1) {
                                                      people--;
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 35,
                                                  width: 35,
                                                  decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: const Icon(Icons.remove),
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                    people = 1;
                                                    update();
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontFamily: 'mont'),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  update();
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'OK',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontFamily: 'mont'),
                                                ))
                                          ],
                                        );
                                      });
                                    });
                              },
                              child: Container(
                                height: height * 0.062,
                                padding: EdgeInsets.only(left: width * 0.058),
                                decoration: BoxDecoration(
                                    color: Colors.white70.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular((50)),
                                    border: Border.all(
                                        color: Colors.white38, width: 1.5)),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.people_outline,
                                      color: Colors.white70,
                                    ),
                                    Text(
                                      '  ${people.toString().padLeft(2, '0')}',
                                      style: const TextStyle(
                                          color: Colors.white70,
                                          fontFamily: 'mont'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.014),
                      GestureDetector(
                        onTap: () {
                          setState(() async {
                            DateTime? datePicked = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2024),
                              initialDate: DateTime.now(),
                              lastDate: DateTime(2025),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData.dark().copyWith(
                                    colorScheme: ColorScheme.dark(
                                      primary: blueColor,
                                      onPrimary: Colors.white,
                                      surface: bgColor,
                                      onSurface: Colors.white,
                                    ),
                                    dialogBackgroundColor: Colors.black54,
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (datePicked != null) {
                              endDate = '${datePicked.day.toString().padLeft(2, '0')}/${datePicked.month.toString().padLeft(2, '0')}/${datePicked.year.toString().padLeft(2, '0')}';
                              setState(() {});
                            }
                          });
                        },
                        child: Container(
                          height: height * 0.062,
                          width: width / 1.6,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: width * 0.05),
                          margin: EdgeInsets.only(right: width * 0.045),
                          decoration: BoxDecoration(
                              color: Colors.white70.withOpacity(0.12),
                              borderRadius: BorderRadius.circular((50)),
                              border: Border.all(
                                  color: Colors.white38, width: 1.5)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.white70,
                              ),
                              Text(
                                '  $endDate',
                                style: const TextStyle(
                                    color: Colors.white70,
                                    fontFamily: 'mont'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.012),
                      ...List.generate(people, (index) => Container(
                        margin: EdgeInsets.only(top: height * 0.02),
                        width: width,
                        child: TextFormField(
                          controller: ctrlList[index],
                          textInputAction: TextInputAction.next,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Field Must be Required !';
                            }
                            return null;
                          },
                          cursorColor: Colors.blue,
                          style: const TextStyle(
                              color: Colors.white, fontFamily: 'mont'),
                          decoration: InputDecoration(
                              fillColor: Colors.white70.withOpacity(0.12),
                              filled: true,
                              hintText: 'Person ${index+1} Name',
                              hintStyle: const TextStyle(
                                  color: Colors.white70, fontFamily: 'mont'),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular((15)),
                                borderSide: const BorderSide(
                                  color: Colors.white38,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular((15)),
                                borderSide: const BorderSide(
                                  color: Colors.white54,
                                    width: 2,
                                )),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular((15)),
                                borderSide: const BorderSide(
                                  color: Colors.white54,
                                  width: 2,
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular((15)),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                )),
                          ),
                        ),
                      )),
                      SizedBox(height: height * 0.4,),
                    ],
                  ),
                ),
              ),
              //todo -----------------> Bottom Button
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child:
              // ),
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: (){
            if(formKey.currentState!.validate()){
              Navigator.push(
                  context,
                  PageTransition(
                      child: const PaymentPage(),
                      type: PageTransitionType
                          .fade));
              total = (cartList[bookingIndex]['price'] * people) * 10/100 + cartList[bookingIndex]['price'] * people;
            }
          },
          child: Expanded(
            child: Container(
              height: height * 0.065,
              margin: EdgeInsets.only(left: width * 0.074),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text('Select Payment Method',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: width * 0.04,fontFamily: 'mont'),),
            ),
          ),
        ),
      ),
    );
  }
}

TextEditingController txtName = TextEditingController();
List ctrlList = [txtName];
