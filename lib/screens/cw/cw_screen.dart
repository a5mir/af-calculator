import 'package:flutter/material.dart';

class CwSceen extends StatefulWidget {
  static String routeName = "/cw";
  CwSceen({Key? key}) : super(key: key);

  @override
  _CwSceenState createState() => _CwSceenState();
}

class _CwSceenState extends State<CwSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Container(),
      ),
    );
  }
}
