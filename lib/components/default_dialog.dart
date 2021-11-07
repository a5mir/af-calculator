import 'package:af_calculator/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultDialog{
  static defaultDialog(
      {required Color primaryColor,
        required Color secondaryColor,
        required String icon,
        required String headerText,
        required String bodyText,
        required context}) {
    showGeneralDialog(
        barrierLabel: "barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 200),
        context: context,
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.center,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        icon,
                        color: secondaryColor,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      Text(headerText,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: secondaryColor,
                            fontFamily: "Muli",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Text(bodyText,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: secondaryColor,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Muli",
                        fontSize: 10,
                      )),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                ],
              ),
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
        transitionBuilder: (_, a1, s2, child) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: child,
            ),
          );
        });
  }
}
