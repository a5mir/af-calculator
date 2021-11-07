import 'package:af_calculator/screens/cw/cw_screen.dart';
import 'package:af_calculator/screens/home/home_screen.dart';
import 'package:af_calculator/screens/list/list_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  ListScreen.routeName: (context) => ListScreen(),
  CwSceen.routeName: (context) => CwSceen(),
};
