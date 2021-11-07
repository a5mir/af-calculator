import 'dart:ffi';

import 'package:af_calculator/components/default_text_field.dart';
import 'package:af_calculator/constants.dart';
import 'package:af_calculator/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CwSceen extends StatefulWidget {
  static String routeName = "/cw";
  CwSceen({Key? key}) : super(key: key);

  @override
  _CwSceenState createState() => _CwSceenState();
}

class _CwSceenState extends State<CwSceen> {
  List<DimTextField> list = [DimTextField()];
  double totalCW = 0;

  addField() {
    list.add(DimTextField());
    setState(() {});
  }

  sumCW() {
    totalCW = 0;
    list.forEach((widget) {
      List<String> qlwh = widget.controller.text.trim().split('x');
      if(qlwh.length == 4 && double.tryParse(qlwh[0]) != null && double.tryParse(qlwh[1]) != null && double.tryParse(qlwh[2]) != null && double.tryParse(qlwh[3]) != null) {
       totalCW += (double.parse(qlwh[0])*(double.parse(qlwh[1]) *double.parse(qlwh[2])*double.parse(qlwh[3])))/6000;
       totalCW = double.parse(totalCW.toStringAsExponential(3));
      } else {
        print('error');
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: list.length,
          itemBuilder: (_, index) => Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: list[index])),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
              height: getProportionateScreenHeight(56),
              child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(56),
                    ),
                    primary: kBlueDarkColor,
                    backgroundColor: kBlueLightColor,
                  ),
                  onPressed: () {
                    sumCW();
                    setState(() {});
                  },
                  child: SvgPicture.asset(
                    "assets/icons/Refresh.svg",
                    color: kBlueDarkColor,
                  ))),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          SizedBox(
            height: getProportionateScreenHeight(56),
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(56)),
                  primary: kGreenDarkColor,
                  backgroundColor: kGreenLightColor),
              onPressed: () {
                addField();
              },
              child: SvgPicture.asset(
                "assets/icons/Add.svg",
                color: kGreenDarkColor,
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          SizedBox(
            height: getProportionateScreenHeight(56),
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(56)),
                  primary: kYellowDarkColor,
                  backgroundColor: kYellowLightColor),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: totalCW.toString())).then((value) =>
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: const Duration(seconds: 1),
                      content: const Text(
                        'Copied to Clipboard',
                        textAlign: TextAlign.center,
                      ),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height / 2,
                          right: 20,
                          left: 20),
                    )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/Copy.svg",
                    color: kYellowDarkColor,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 100),
                    child: Text(
                      "$totalCW kg",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: const TextStyle(
                          color: kYellowDarkColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DimTextField extends StatelessWidget {
  final Function? press;
  TextEditingController controller = new TextEditingController();
  DimTextField({
    Key? key,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: DefaultTextField(
          labelText: "QxLxWxH (cm)",
          textEditingController: controller,
        )),
        SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 3,
        ),
        Column(
          children: [
            SizedBox(
                width: 40,
                height: 40,
                child: TextButton(
                    onPressed: press as void Function()?,
                    style: TextButton.styleFrom(
                        backgroundColor: kRedLightColor, shape: CircleBorder()),
                    child: SvgPicture.asset(
                      "assets/icons/Delete.svg",
                      color: kRedDarkColor,
                    ))),
          ],
        ),
      ],
    );
  }
}
