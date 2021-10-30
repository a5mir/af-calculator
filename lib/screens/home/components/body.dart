import 'package:af_calculator/components/default_dropdown_button.dart';
import 'package:af_calculator/components/default_text_field.dart';
import 'package:af_calculator/constants.dart';
import 'package:af_calculator/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        //mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(56),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(56),),
                primary: kRedDarkColor,
                backgroundColor: kRedLightColor,
              ),
              onPressed: (){},
              child: SvgPicture.asset("assets/icons/Clear.svg", color: kRedDarkColor,),
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(10),),
          SizedBox(
            height: getProportionateScreenHeight(56),
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(56)),
                  primary: kGreenDarkColor,
                  backgroundColor: kGreenLightColor),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/Add.svg", color: kGreenDarkColor,),
                  SizedBox(width: getProportionateScreenWidth(5),),
                  Text(
                    "19990.0 EUR",
                    style: TextStyle(
                        color: kGreenDarkColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: getProportionateScreenWidth(5),),
                ],
              )
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  children: [
                    Expanded(child: DefaultTextField(labelText: "AOL")),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Expanded(child: DefaultTextField(labelText: "AOD")),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                DefaultTextField(labelText: "CHARGEABLE WEIGHT (kg)"),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: kPrimaryLightColor,
                ),
                Text(
                  "AIRFREIGHT",
                  style: TextStyle(color: kPrimaryLight),
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: kPrimaryLightColor,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 60,
                      child: DefaultTextField(
                        labelText: "A/F per kg",
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Expanded(flex: 40, child: DefaultDropdownButton()),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: kPrimaryLightColor,
                ),
                Text(
                  "ORIGIN CHARGES",
                  style: TextStyle(color: kPrimaryLight),
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: kPrimaryLightColor,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 60,
                      child: DefaultTextField(
                        labelText: "ORIGIN C.",
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Expanded(flex: 40, child: DefaultDropdownButton()),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 60,
                      child: DefaultTextField(
                        labelText: "ORIGIN C. per kg",
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Expanded(flex: 40, child: DefaultDropdownButton()),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: kPrimaryLightColor,
                ),
                Text(
                  "DESTINATION CHARGES",
                  style: TextStyle(color: kPrimaryLight),
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: kPrimaryLightColor,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 60,
                      child: DefaultTextField(
                        labelText: "DESTINATION C.",
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Expanded(flex: 40, child: DefaultDropdownButton()),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 60,
                      child: DefaultTextField(
                        labelText: "DESTINATION C. per kg",
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Expanded(flex: 40, child: DefaultDropdownButton()),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: kPrimaryLightColor,
                ),
                Text(
                  "OTHER CHARGES",
                  style: TextStyle(color: kPrimaryLight),
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: kPrimaryLightColor,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 60,
                      child: DefaultTextField(
                        labelText: "OTHER C.",
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Expanded(flex: 40, child: DefaultDropdownButton()),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 60,
                      child: DefaultTextField(
                        labelText: "OTHER C. per kg",
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Expanded(flex: 40, child: DefaultDropdownButton()),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(80),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
