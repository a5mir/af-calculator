import 'package:af_calculator/components/default_text_field.dart';
import 'package:af_calculator/constants.dart';
import 'package:af_calculator/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            DefaultTextField(labelText: "A/F per kg"),
          ],
        ),
      ),
    );
  }
}
