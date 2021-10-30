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
  var _aolController = TextEditingController();
  var _aodController = TextEditingController();
  var _cwController = TextEditingController();
  var _afController = TextEditingController();
  var _ocController = TextEditingController();
  var _ocpkgController = TextEditingController();
  var _dcController = TextEditingController();
  var _dcpkgController = TextEditingController();
  var _otcController = TextEditingController();
  var _otcpkgController = TextEditingController();



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
              onPressed: (){_clearTextFields();},
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
                    Expanded(child: DefaultTextField(labelText: "AOL", textEditingController: _aolController,)),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Expanded(child: DefaultTextField(labelText: "AOD", textEditingController: _aodController,)),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                DefaultTextField(labelText: "CHARGEABLE WEIGHT (kg)", textEditingController: _cwController,),
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
                        textEditingController: _afController,
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
                        textEditingController: _ocController,
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
                        textEditingController: _ocpkgController,
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
                        textEditingController: _dcController,
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
                        textEditingController: _dcpkgController,
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
                        textEditingController: _otcController,
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
                        textEditingController: _otcpkgController,
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

  void _clearTextFields() {
    _aolController.clear();
    _aodController.clear();
    _cwController.clear();
    _afController.clear();
    _ocController.clear();
    _ocpkgController.clear();
    _dcController.clear();
    _dcpkgController.clear();
    _otcController.clear();
    _otcpkgController.clear();
  }
}
