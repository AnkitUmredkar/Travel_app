import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/utils/global.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            background(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(width * 0.047,height * 0.022,width * 0.047,height * 0.022),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'General',
                          style: TextStyle(
                              fontSize: width * 0.043, fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'mont'),
                        )),
                  ),
                  Container(
                    width: width,
                    margin: EdgeInsets.only(left: width * 0.02,right: width * 0.02),
                    padding: EdgeInsets.only(top: width * 0.01,bottom: width * 0.01),
                    decoration: BoxDecoration(
                      color: Colors.white70.withOpacity(0.12),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Language',style: TextStyle(color: Colors.white,fontFamily:'mont',fontSize: width*0.04),),
                          trailing: Icon(CupertinoIcons.right_chevron,color: Colors.white70,size: width*0.05,),
                        ),
                        SizedBox(height: height*0.005),
                        Divider(height: height*0.002,color: Colors.grey,endIndent: 10,indent: 10,),
                        SizedBox(height: height*0.005),
                        ListTile(
                          title: Text('Notification Setting',style: TextStyle(color: Colors.white,fontFamily:'mont',fontSize: width*0.04),),
                          trailing: Icon(CupertinoIcons.right_chevron,color: Colors.white70,size: width*0.05,),
                        ),
                        SizedBox(height: height*0.005,),
                        Divider(height: height*0.002,color: Colors.grey,endIndent: 10,indent: 10,),
                        ListTile(
                          title: Text('Language',style: TextStyle(color: Colors.white,fontFamily:'mont',fontSize: width*0.04),),
                          trailing: Icon(CupertinoIcons.right_chevron,color: Colors.white70,size: width*0.05,),
                        ),
                        SizedBox(height: height*0.005),
                        Divider(height: height*0.002,color: Colors.grey,endIndent: 10,indent: 10,),
                        ListTile(
                          title: Text('Location',style: TextStyle(color: Colors.white,fontFamily:'mont',fontSize: width*0.04),),
                          trailing: Switch(value: location,
                            activeColor: Colors.blue,
                            onChanged: (bool value) {
                              setState(() {
                                location = value;
                              });
                            },),
                        ),
                        SizedBox(height: height*0.005),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(width * 0.047,height * 0.022,width * 0.047,height * 0.022),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Account & Security',
                          style: TextStyle(
                              fontSize: width * 0.043, fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'mont'),
                        )),
                  ),
                  Container(
                    width: width,
                    margin: EdgeInsets.only(left: width * 0.02,right: width * 0.02),
                    padding: EdgeInsets.only(top: width * 0.01,bottom: width * 0.01),
                    decoration: BoxDecoration(
                      color: Colors.white70.withOpacity(0.12),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Email and Mobile Number',style: TextStyle(color: Colors.white,fontFamily:'mont',fontSize: width*0.04),),
                          trailing: Icon(CupertinoIcons.right_chevron,color: Colors.white70,size: width*0.05,),
                        ),
                        SizedBox(height: height*0.005),
                        Divider(height: height*0.002,color: Colors.grey,endIndent: 10,indent: 10,),
                        SizedBox(height: height*0.005),
                        ListTile(
                          title: Text('Security Setting',style: TextStyle(color: Colors.white,fontFamily:'mont',fontSize: width*0.04),),
                          trailing: Icon(CupertinoIcons.right_chevron,color: Colors.white70,size: width*0.05,),
                        ),
                        SizedBox(height: height*0.005,),
                        Divider(height: height*0.002,color: Colors.grey,endIndent: 10,indent: 10,),
                        ListTile(
                          title: Text('Log Out',style: TextStyle(color: Colors.red,fontFamily:'mont',fontSize: width*0.04),),
                          trailing: Icon(CupertinoIcons.right_chevron,color: Colors.red,size: width*0.05,),
                        ),
                        SizedBox(height: height*0.005),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(width * 0.047,height * 0.022,width * 0.047,height * 0.022),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Other',
                          style: TextStyle(
                              fontSize: width * 0.043, fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'mont'),
                        )),
                  ),
                  Container(
                    width: width,
                    margin: EdgeInsets.only(left: width * 0.02,right: width * 0.02),
                    padding: EdgeInsets.only(top: width * 0.01,bottom: width * 0.01),
                    decoration: BoxDecoration(
                      color: Colors.white70.withOpacity(0.12),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('About Travelling',style: TextStyle(color: Colors.white,fontFamily:'mont',fontSize: width*0.04),),
                          trailing: Icon(CupertinoIcons.right_chevron,color: Colors.white70,size: width*0.05,),
                        ),
                        SizedBox(height: height*0.005),
                        Divider(height: height*0.002,color: Colors.grey,endIndent: 10,indent: 10,),
                        SizedBox(height: height*0.005),
                        ListTile(
                          title: Text('Privacy Policy',style: TextStyle(color: Colors.white,fontFamily:'mont',fontSize: width*0.04),),
                          trailing: Icon(CupertinoIcons.right_chevron,color: Colors.white70,size: width*0.05,),
                        ),
                        SizedBox(height: height*0.005,),
                        Divider(height: height*0.002,color: Colors.grey,endIndent: 10,indent: 10,),
                        ListTile(
                          title: Text('Term & Condition',style: TextStyle(color: Colors.white,fontFamily:'mont',fontSize: width*0.04),),
                          trailing: Icon(CupertinoIcons.right_chevron,color: Colors.white70,size: width*0.05,),
                        ),
                        SizedBox(height: height*0.005),
                        Divider(height: height*0.002,color: Colors.grey,endIndent: 10,indent: 10,),
                        ListTile(
                          title: Text('Rate Travel App',style: TextStyle(color: Colors.white,fontFamily:'mont',fontSize: width*0.04),),
                          trailing: Icon(CupertinoIcons.right_chevron,color: Colors.white70,size: width*0.05,),
                        ),
                        SizedBox(height: height*0.005),
                      ],
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

bool location = false;