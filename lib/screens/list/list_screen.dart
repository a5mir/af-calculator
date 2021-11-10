import 'package:af_calculator/constants.dart';
import 'package:af_calculator/model/offer.dart';
import 'package:af_calculator/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListScreen extends StatefulWidget {
  static String routeName = "/list";
  ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  var _tapPosition;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: GestureDetector(
        child: offerList.isNotEmpty ? ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: offerList.length,
          itemBuilder: (context, index) {
            Offer offer = offerList[index];
            return GestureDetector(
              onTapDown: _storePosition,
              onLongPress: () {
                final RenderObject? overlay =
                    Overlay.of(context)?.context.findRenderObject();
                showMenu(
                  color: kBackgroundColor,
                  items: <PopupMenuEntry>[
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/Delete.svg", color: kRedDarkColor,),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Text("Delete", style: TextStyle(color: kRedDarkColor),),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/Edit.svg", color: kBlueDarkColor,),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Text("Edit", style: TextStyle(color: kBlueDarkColor),),
                        ],
                      ),
                    ),
                  ],
                  context: context,
                  position: RelativeRect.fromRect(
                      _tapPosition & const Size(40, 40),
                      Offset.zero & overlay!.semanticBounds.size),
                  
                ).then((value) {setState(() {
                  switch(value) {
                    case 1: offerList.remove(offer);
                    break;
                    case 2: //edit
                    break;
                  }

                });});
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: BorderSide(color: kPrimaryLightColor, width: 2.0),
                  ),
                  elevation: 3.0,
                  shadowColor: Colors.black54,
                  color: kBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "\u20ac " + offer.value.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(30)),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(5),
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: kPrimaryLightColor,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        IntrinsicHeight(
                          child: Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 12,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Aol.svg",
                                  color: Colors.black54,
                                ),
                                Text(
                                  offer.aol,
                                  textAlign: TextAlign.center,
                                ),
                                Container(
                                  height: getProportionateScreenHeight(30),
                                  width: 2,
                                  color: kPrimaryLightColor,
                                ),
                                SvgPicture.asset(
                                  "assets/icons/Aod.svg",
                                  color: Colors.black54,
                                ),
                                Text(offer.aod),
                                Container(
                                  height: getProportionateScreenHeight(30),
                                  width: 2,
                                  color: kPrimaryLightColor,
                                ),
                                SvgPicture.asset(
                                  "assets/icons/BoxB.svg",
                                  color: Colors.black54,
                                ),
                                Text(offer.cw.toString() + " kg"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ): Center(child: Column(mainAxisAlignment: MainAxisAlignment.center ,children: [SvgPicture.asset("assets/icons/List.svg", width: getProportionateScreenHeight(50),), SizedBox(height: getProportionateScreenHeight(20),), Text("EMPTY LIST! \n Any new calculation will appear here.", textAlign: TextAlign.center,),],) ),
      ),
    );
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }
}
