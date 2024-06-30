import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel_app/Screen/DetailPage/detailPage.dart';
import '../../utils/global.dart';

List foundUser2 = [];

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    for(int i=0; i<packageList.length; i++){
      for(int j=0; j<packageList[i].length; j++){
        foundUser.add(packageList[i][j]);
        foundUser2.add(packageList[i][j]);
      }
    }
    super.initState();
  }
  void runFilter(String value) {
    List results = [];
    if (value.isEmpty) {
      results = foundUser2;
    } else {
      results = foundUser2
          .where((user) =>
          user['location'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      foundUser = results;
    });
  }
  Widget build(BuildContext context) {

    @override
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            background(),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(width * 0.04, height * 0.04, width * 0.04, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8.5, sigmaY: 8.5),
                      child: Container(
                        height: height * 0.078,
                        width: width,
                        padding: const EdgeInsets.fromLTRB(0, 10, 16, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white70.withOpacity(0.12),
                        ),
                        child: TextField(
                          onChanged: (value) => runFilter(value),
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
                Expanded(
                  child: (foundUser.length > 0)
                      ? Padding(
                    padding: EdgeInsets.all(width * 0.04),
                    child: ListView.builder(
                      itemCount: foundUser.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                              selectedIndex = index;
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const DetailPage(),
                                    type: PageTransitionType
                                        .fade));
                          },
                          contentPadding: const EdgeInsets.all(2),
                          title: Text(
                            '${foundUser[index]["name"]}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            '${foundUser[index]['location']}',
                            style: const TextStyle(color: Colors.white60),
                          ),
                          trailing: Text(
                            '₹ ${foundUser[index]['price']}',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: width * 0.035
                            ),
                          ),
                        );
                      },
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

int idx = 0;