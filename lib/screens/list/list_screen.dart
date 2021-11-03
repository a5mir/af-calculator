import 'package:af_calculator/constants.dart';
import 'package:af_calculator/model/offer.dart';
import 'package:af_calculator/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  leading: Container(width: getProportionateScreenWidth(120),child: Text(offer.value.toString(), overflow: TextOverflow.fade, maxLines: 1, softWrap: false , style: TextStyle(fontSize: getProportionateScreenWidth(20), fontWeight: FontWeight.bold, color: Colors.black),)),
                  trailing: IntrinsicHeight(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 12,
                      children: [
                        Container(
                          height: getProportionateScreenHeight(30),
                          width: 2,
                          color: kPrimaryLightColor,
                        ),
                        SvgPicture.asset("assets/icons/Aol.svg", color: Colors.black54,),
                        Text(offer.aol, textAlign: TextAlign.center,),
                        Container(
                          height: getProportionateScreenHeight(30),
                          width: 2,
                          color: kPrimaryLightColor,
                        ),
                        SvgPicture.asset("assets/icons/Aod.svg", color: Colors.black54,),
                        Text(offer.aod),
                      ],
                    ),
                  ),
                ),

              ),
            );
          },
        ),
      ),
    );
  }
}
