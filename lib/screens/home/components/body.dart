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
    return GestureDetector(
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
              Row(
                children: [
                  Expanded(
                    flex: 60,
                    child: DefaultTextField(labelText: "A/F per kg", textInputType: TextInputType.number,),
                  ),
                  SizedBox(width: getProportionateScreenWidth(20),),
                  Expanded(flex: 40 ,child: DefaultDropdownButton()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

