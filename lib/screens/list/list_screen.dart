import 'package:af_calculator/constants.dart';
import 'package:af_calculator/model/offer.dart';
import 'package:af_calculator/size_config.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  static String routeName = "/list";
  ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: GestureDetector(
        child: ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: offerList.length,
          itemBuilder: (context, index){
            Offer offer = offerList[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(color: kPrimaryLightColor, width: 2.0),
                ),
                elevation: 3.0,
                shadowColor: Colors.black54,
                color: kBackgroundColor,
                child: ListTile(
                  onTap: (){},
                  title: Text(offer.value.toString() + " EUR"),
                  subtitle: Text("AOL: " + offer.aol + " AOD: " + offer.aod),
                 ),
              ),
            );
          },
        ),
      ),
    );
  }
}
