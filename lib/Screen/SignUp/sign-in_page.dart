import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel_app/Screen/SignUp/sign-up_page.dart';
import 'package:travel_app/utils/auth_service.dart';

import '../HomePage/homePage.dart';


GlobalKey<FormState> formKeySignIn = GlobalKey();
TextEditingController txtEmail = TextEditingController();
TextEditingController txtPassword = TextEditingController();

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // final AuthService _authService = AuthService();
  // User? _user;
  //
  // void _signIn() async {
  //   User? user = await _authService.signInWithGoogle();
  //   setState(() {
  //     _user = user;
  //   });
  // }
  // void _signOut() async {
  //   await _authService.signOut();
  //   setState(() {
  //     _user = null;
  //   });
  // }

  @override
  void initState(){
    txtEmail.text = 'ankitumredkar77@gmail.com' ;
    txtPassword.text = 'Anku@2519';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff121212),
        body: Form(
          key: formKeySignIn,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.of(context).pop();
                  //   },
                  //   child: Icon(
                  //     Icons.arrow_back_ios,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  SizedBox(height: height * 0.045),
                  Text('Welcome back',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.072,
                          fontFamily: 'mont',
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: height * 0.04),
                  Text('Email address',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                          fontFamily: 'mont',
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  TextFormField(
                    validator: (value) {
                      bool checkCapital = false;
                      bool checkSpeChar = false;
                      if (value!.isEmpty) {
                        return 'Enter an email or phone number !';
                      } else if (!value.contains('@gmail.com')) {
                        return '"@gmail.com"is not Perfact !';
                      } else if (value.contains(' ')) {
                        return 'Space is not Allow !';
                      } else if (value.length <= 10) {
                        return 'Enter valid e-mail or phone number';
                      }

                      for (int i = 0; i < value.length; i++) {
                        if (value[i] != value[i].toLowerCase()) {
                          checkCapital = true;
                        }
                      }
                      if (checkCapital) {
                        return 'Capital Letter is not Allow !';
                      }
                      for (int i = 0; i < value.length; i++) {
                        int charCode = value.codeUnitAt(i);
                        if ((charCode >= 32 && charCode <= 45) ||
                            (charCode == 47) ||
                            (charCode >= 58 && charCode <= 63) ||
                            (charCode >= 91 && charCode <= 96) ||
                            (charCode >= 123 && charCode <= 126)) {
                          checkSpeChar = true;
                        }
                      }
                      if (checkSpeChar) {
                        return 'Special character is not Allow !';
                      }
                      return null;
                    },
                    controller:  txtEmail,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.teal,
                    decoration: InputDecoration(
                      fillColor: const Color(0xff333333),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Color(0xff5D5D5D), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Colors.redAccent, width: 2)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Color(0xff5D5D5D), width: 2)),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Text('Password',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                          fontFamily: 'mont',
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a password!';
                      } else if (value.contains(' ')) {
                        return 'Space is not Allow !';
                      } else if (value.length <= 8) {
                        return 'Password length must be greater then 8';
                      }

                      for (int i = 0; i < value.length; i++) {
                        if (value[i] != value[i].toLowerCase()) {
                          checkCapital = true;
                        }
                        if (value[i] != value[i].toUpperCase()) {
                          checkSmall = true;
                        }
                      }
                      if (!checkCapital) {
                        return 'Minimum 1 character is need capital !';
                      }
                      if (!checkSmall) {
                        return 'Minimum 1 character is need small !';
                      }
                      for (int i = 0; i < value.length; i++) {
                        int charCode = value.codeUnitAt(i);
                        if ((charCode >= 32 && charCode <= 45) ||
                            (charCode == 47) ||
                            (charCode >= 58 && charCode <= 64) ||
                            (charCode >= 91 && charCode <= 96) ||
                            (charCode >= 123 && charCode <= 126)) {
                          checkSpeChar = true;
                        }
                        if ((charCode >= 48 && charCode <= 57)) {
                          checkDigit = true;
                        }
                      }
                      if (!checkSpeChar) {
                        return 'Minimum 1 character is need Special Character !';
                      }
                      if (!checkDigit) {
                        return 'Minimum 1 character is need Digit !';
                      }
                      return null;
                    },
                    controller: txtPassword,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.teal,
                    decoration: InputDecoration(
                      fillColor: const Color(0xff333333),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Color(0xff5D5D5D), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Colors.redAccent, width: 2)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Color(0xff5D5D5D), width: 2)),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Text('Forgot password?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontFamily: 'mont',
                          fontSize: width * 0.04)),
                  SizedBox(height: height * 0.035),
                  GestureDetector(
                    onTap: () {
                      if (formKeySignIn.currentState!.validate()) {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         child: SignUpPage(),
                        //         type: PageTransitionType.rightToLeft));
                      }
                    },
                    child: Container(
                      height: height * 0.068,
                      width: width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: Text('Sign in',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: width * 0.042,
                              fontFamily: 'mont',
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height: height * 0.024),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const SignUpPage(),
                              type: PageTransitionType.rightToLeft));
                    },
                    child: Container(
                      height: height * 0.068,
                      width: width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text('Sign up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.042,
                              fontFamily: 'mont',
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height: height * 0.052),
                  //todo ----------------> lats 3 icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          await FireBaseServices().googleSignOut();
                        },
                        child: Image.asset(
                          'assets/images/SignUpPage_Images/facebook.png',
                          height: width * 0.1,
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () async {
                          await FireBaseServices().signInWithGoogle();
                          Navigator.push(context, PageTransition(
                              child: const HomePage(),
                              type: PageTransitionType.rightToLeft));
                        },
                        child: Image.asset('assets/images/SignUpPage_Images/google.png',
                                height: width * 0.1),
                      ),
                     //  _user == null ? InkWell(
                     //   onTap: () {
                     //         _signIn();
                     //   },
                     //   child: Image.asset('assets/images/SignUpPage_Images/google.png',
                     //       height: width * 0.1),
                     // ) :
                     //  Column(
                     //    children: [
                     //      TextButton(
                     //          onPressed: _signOut,
                     //          child: Text('Sign out',style: TextStyle(color: Colors.blue,fontSize: width*0.05 ),)),
                     //    ],
                     //  ),
                      //   Column(
                      //   children: [
                      //     Text('Signed in as ${_user!.displayName}'),
                      //     ElevatedButton(
                      //       child: Text('Sign out'),
                      //       onPressed: _signOut,
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(width: 20),
                      Image.asset('assets/images/SignUpPage_Images/twitter.png',
                          height: width * 0.1),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

bool checkCapital = false,
    checkSmall = false,
    checkSpeChar = false,
    checkDigit = false,
    hideOrNot = false;
