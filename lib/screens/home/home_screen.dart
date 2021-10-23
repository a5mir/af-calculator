import 'package:af_calculator/constants.dart';
import 'package:af_calculator/screens/home/components/Body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  late PageController _pageController;

  List<Widget> tabPages = [Body()];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: PageView(children: tabPages, onPageChanged: onPageChanged, controller: _pageController,),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        currentIndex: _pageIndex,
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/Home.svg", color: Colors.black),label: 'Home', activeIcon: SvgPicture.asset("assets/icons/HomeB.svg", color: kPrimaryColor,)),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/Home.svg", color: Colors.black),label: 'Home', activeIcon: SvgPicture.asset("assets/icons/HomeB.svg", color: kPrimaryColor,)),
        ],
        onTap: onTabTapped,
      ),
    );
  }
  void onPageChanged(int page){
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index){
    this._pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
