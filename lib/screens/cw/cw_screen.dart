import 'package:af_calculator/components/default_text_field.dart';
import 'package:af_calculator/constants.dart';
import 'package:af_calculator/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CwSceen extends StatefulWidget {
  static String routeName = "/cw";
  CwSceen({Key? key}) : super(key: key);

  @override
  _CwSceenState createState() => _CwSceenState();
}

class _CwSceenState extends State<CwSceen> {
  List<Widget> list = <Widget>[];

  addField() {
    list.add(DimTextField());
    setState(() {

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
            itemBuilder: (_, index) => Padding(padding: EdgeInsets.fromLTRB(15, 10, 15, 10),child: list[index])),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addField();
        },
      ),
    );
  }
}

class DimTextField extends StatelessWidget {
  final Function? press;
  DimTextField({
    Key? key,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                Expanded(child: DefaultTextField(labelText: "QxLxWxH")),
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
                                backgroundColor: kRedLightColor,
                                shape: CircleBorder()),
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
