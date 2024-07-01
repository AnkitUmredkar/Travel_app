import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel_app/Screen/SignUp/sign-in_page.dart';
import 'package:travel_app/utils/global.dart';

import '../HomePage/homePage.dart';

ImagePicker imagePicker = ImagePicker();
File? fileImage;
XFile? xFileImage;

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  void update(){
    setState(() {});
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
              Padding(
                padding: EdgeInsets.fromLTRB(width * 0.04,0,width * 0.04,10),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: const HomePage(),
                                          type: PageTransitionType
                                              .fade));
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: width * 0.25),
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    color: Colors.white,
                                    fontFamily: 'mont'),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: height * 0.04),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          padding: const EdgeInsets.all(15),
                                          height: 143,
                                          color: bgColor,
                                          child: Column(
                                            children: [
                                              ListTile(
                                                onTap: () async {
                                                  xFileImage =
                                                  await imagePicker.pickImage(
                                                      source: ImageSource.gallery);
                                                  setState(() {
                                                    fileImage = File(xFileImage!.path);
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                title: const Text('Gallery',style: TextStyle(color: Colors.white),),
                                                leading: const Icon(Icons.image,color: Colors.white,),
                                              ),
                                              ListTile(
                                                onTap: () async {
                                                  xFileImage =
                                                  await imagePicker.pickImage(
                                                      source: ImageSource.camera);
                                                  setState(() {
                                                    fileImage = File(xFileImage!.path);
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                title: const Text('Camera',style: TextStyle(color: Colors.white),),
                                                leading: const Icon(Icons.camera_alt,color: Colors.white,),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 27),
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
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: (fileImage == null)
                                            ? Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Icon(Icons.person,color: Colors.white24,size: width *0.2,)
                                        )
                                            : null,
                                      ),
                                      Positioned(
                                        bottom: -27,
                                        right: 0,
                                        child: Container(
                                          height: height * 0.12,
                                          width: width * 0.12,
                                          decoration: BoxDecoration(
                                              color: blueColor, shape: BoxShape.circle),
                                          child: const Icon(
                                            Icons.camera_alt_outlined,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.044),
                        Text('User Name',style: TextStyle(fontSize: width * 0.04,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'mont'),),
                        SizedBox(height: height * 0.011),
                        GestureDetector(
                          onTap: (){
                            popupCtrl = TextEditingController();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(builder: (BuildContext context,
                                      StateSetter setState){
                                    return AlertDialog(
                                      backgroundColor: bgColor,
                                      contentPadding: const EdgeInsets.fromLTRB(20,25,20,25),
                                      content: TextField(
                                        style: const TextStyle(color: Colors.white,fontFamily: 'mont'),
                                        controller: popupCtrl,
                                        cursorColor: Colors.blue,
                                        decoration: const InputDecoration(
                                          hintText: 'Enter Your Name',
                                          hintStyle: TextStyle(color: Colors.white70,fontFamily: 'mont')
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
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
                                              nameCtrl.text = popupCtrl.text;
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
                            alignment: Alignment.center,
                            height: height * 0.073,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white70.withOpacity(0.12),
                            ),
                            child: ListTile(
                              title: Text(nameCtrl.text,style: const TextStyle(color: Colors.white,fontFamily: 'mont'),),
                              trailing: const Icon(Icons.edit,color: Colors.white70),
                            ),
                          )
                        ),
                        //todo -------------------------> Location
                        SizedBox(height: height * 0.022),
                        Text('Location',style: TextStyle(fontSize: width * 0.04,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'mont'),),
                        SizedBox(height: height * 0.011),
                        GestureDetector(
                            onTap: (){
                              popupCtrl= TextEditingController();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder: (BuildContext context,
                                        StateSetter setState){
                                      return AlertDialog(
                                        backgroundColor: bgColor,
                                        contentPadding: const EdgeInsets.fromLTRB(20,25,20,25),
                                        content: TextField(
                                          style: const TextStyle(color: Colors.white,fontFamily: 'mont'),
                                          controller: popupCtrl,
                                          cursorColor: Colors.blue,
                                          decoration: const InputDecoration(
                                              hintText: 'Enter Your Location',
                                              hintStyle: TextStyle(color: Colors.white70,fontFamily: 'mont')
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
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
                                                locationCtrl.text = popupCtrl.text;
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
                              alignment: Alignment.center,
                              height: height * 0.073,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white70.withOpacity(0.12),
                              ),
                              child: ListTile(
                                title: Text(locationCtrl.text,style: const TextStyle(color: Colors.white,fontFamily: 'mont'),),
                                trailing: const Icon(Icons.edit,color: Colors.white70),
                              ),
                            )
                        ),
                        //todo -------------------------> Nationality
                        SizedBox(height: height * 0.022),
                        Text('Nationality',style: TextStyle(fontSize: width * 0.04,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'mont'),),
                        SizedBox(height: height * 0.011),
                        GestureDetector(
                            onTap: (){
                              popupCtrl= TextEditingController();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder: (BuildContext context,
                                        StateSetter setState){
                                      return AlertDialog(
                                        backgroundColor: bgColor,
                                        contentPadding: const EdgeInsets.fromLTRB(20,25,20,25),
                                        content: TextField(
                                          style: const TextStyle(color: Colors.white,fontFamily: 'mont'),
                                          controller: popupCtrl,
                                          cursorColor: Colors.blue,
                                          decoration: const InputDecoration(
                                              hintText: 'Enter Your Nation',
                                              hintStyle: TextStyle(color: Colors.white70,fontFamily: 'mont')
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
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
                                                nationCtrl.text = popupCtrl.text;
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
                              alignment: Alignment.center,
                              height: height * 0.073,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white70.withOpacity(0.12),
                              ),
                              child: ListTile(
                                title: Text(nationCtrl.text,style: const TextStyle(color: Colors.white,fontFamily: 'mont'),),
                                trailing: const Icon(Icons.edit,color: Colors.white70),
                              ),
                            )
                        ),
                        //todo -------------------------> Mobile Number
                        SizedBox(height: height * 0.022),
                        Text('Mobile Number',style: TextStyle(fontSize: width * 0.04,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'mont'),),
                        SizedBox(height: height * 0.011),
                        GestureDetector(
                            onTap: (){
                              popupCtrl= TextEditingController();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder: (BuildContext context,
                                        StateSetter setState){
                                      return AlertDialog(
                                        backgroundColor: bgColor,
                                        contentPadding: const EdgeInsets.fromLTRB(20,25,20,25),
                                        content: TextField(
                                          style: const TextStyle(color: Colors.white,fontFamily: 'mont'),
                                          controller: popupCtrl,
                                          cursorColor: Colors.blue,
                                          decoration: const InputDecoration(
                                              hintText: 'Enter Mobile Numner',
                                              hintStyle: TextStyle(color: Colors.white70,fontFamily: 'mont')
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
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
                                                numberCtrl.text = popupCtrl.text;
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
                              alignment: Alignment.center,
                              height: height * 0.073,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white70.withOpacity(0.12),
                              ),
                              child: ListTile(
                                title: Text(numberCtrl.text,style: const TextStyle(color: Colors.white,fontFamily: 'mont'),),
                                trailing: const Icon(Icons.edit,color: Colors.white70),
                              ),
                            )
                        ),
                        //todo -------------------------> E-mail
                        SizedBox(height: height * 0.022),
                        Text('E mail',style: TextStyle(fontSize: width * 0.04,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'mont'),),
                        SizedBox(height: height * 0.011),
                        Container(
                          alignment: Alignment.center,
                          height: height * 0.073,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white70.withOpacity(0.12),
                          ),
                          child: ListTile(
                            title: Text(txtEmail.text,style: const TextStyle(color: Colors.white,fontFamily: 'mont'),),
                            trailing: const Icon(Icons.edit,color: Colors.white70),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ],
          )
      ,));
  }
}
TextEditingController nameCtrl = TextEditingController();
TextEditingController locationCtrl = TextEditingController();
TextEditingController numberCtrl = TextEditingController();
TextEditingController nationCtrl = TextEditingController();
TextEditingController popupCtrl = TextEditingController();
