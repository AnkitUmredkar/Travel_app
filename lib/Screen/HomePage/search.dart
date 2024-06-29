import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/global.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    void initState() {
      // TODO: implement initState
      foundUser = packageList;
      super.initState();
    }

    void runFilter(String value) {
      List results = [];
      if (value.isEmpty) {
        results = packageList;
      } else {
        results = packageList
            .where((user) =>
                user['location'].toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
      setState(() {
        foundUser = results;
      });
    }

    @override
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                    center: Alignment.bottomLeft,
                    radius: 0.75,
                    colors: [
                      Color(0xff5670ff),
                      Color(0xff000206),
                    ]),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 320,
                width: 320,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                      center: Alignment.topRight,
                      radius: 0.75,
                      colors: [
                        Color(0xff5670ff),
                        Color(0xff000206),
                      ]),
                ),
              ),
            ),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 250, sigmaY: 250),
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.black12.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: height * 0.04,
                      left: height * 0.01,
                      right: height * 0.01),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8.5, sigmaY: 8.5),
                      child: Container(
                        height: height * 0.078,
                        width: width,
                        padding: EdgeInsets.fromLTRB(0, 10, 16, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white70.withOpacity(0.12),
                        ),
                        child: TextField(
                          onChanged: (value) => runFilter(value),
                          cursorColor: Colors.blue,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'mont'),
                          decoration: InputDecoration(
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
                Expanded(
                  child: (foundUser.length > 0)
                      ? Padding(
                          padding: EdgeInsets.all(width * 0.05),
                          child: ListView.builder(
                            itemCount: foundUser.length,
                            itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                                Navigator.of(context).pushNamed('/detail');
                              },
                              contentPadding: const EdgeInsets.all(2),
                              title: Text(
                                '${foundUser[index]["name"]}',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                '${foundUser[index]['location']}',
                                style: TextStyle(color: Colors.white60),
                              ),
                              trailing: Text(
                                '${foundUser[index]['rate']}',
                                style: const TextStyle(
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const Center(
                          child: Text(
                            'No result found!',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
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
