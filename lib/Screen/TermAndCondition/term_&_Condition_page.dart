import 'package:flutter/material.dart';

class TermConditionPage extends StatefulWidget {
  const TermConditionPage({super.key});

  @override
  State<TermConditionPage> createState() => _TermConditionPageState();
}

class _TermConditionPageState extends State<TermConditionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          //todo -------------------> font family : 'mont'
          title: const Text('Travel App',style: TextStyle(color: Colors.white,fontFamily: 'mont',),),
        ),
      )
      ,);
  }
}
