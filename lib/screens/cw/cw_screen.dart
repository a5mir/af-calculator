import 'package:af_calculator/components/default_dialog.dart';
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
  final List<TextEditingController> _listController = [];
  double totalCW = 0;

  sumCW() {
    totalCW = 0;

    List<String> list = _listController.map((TextEditingController controller) {
      return controller.text;
    }).toList();

    for (var text in list) {
      List<String> qlwh = text.trim().split('x');
      if(qlwh.length == 4 && double.tryParse(qlwh[0]) != null && double.tryParse(qlwh[1]) != null && double.tryParse(qlwh[2]) != null && double.tryParse(qlwh[3]) != null) {
       totalCW += (double.parse(qlwh[0])*(double.parse(qlwh[1]) *double.parse(qlwh[2])*double.parse(qlwh[3])))/6000;
       totalCW = double.parse(totalCW.toStringAsExponential(3));
      } else {
        DefaultDialog.defaultDialog(
            primaryColor: kRedLightColor,
            secondaryColor: kRedDarkColor,
            icon: "assets/icons/Error.svg",
            headerText: "ERROR",
            bodyText: "Please make sure all fields are filled in correctly.",
            context: context);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _listController.insert(0, TextEditingController());
  }

  @override
  void dispose() {
    for(TextEditingController controller in _listController){
      controller.dispose();
    }
    super.dispose();
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
          itemCount: _listController.length,
          itemBuilder: (_, index) => Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(
                children: [
                  _textField(index),
                ],
              ))),
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

  Widget _textField(index){
    return Row(
      children: [
        Expanded(
            child: DefaultTextField(
              labelText: "QxLxWxH (cm)",
              textEditingController: _listController[index],
            )),
        SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 3,
        ),
        Row(
          children: [
            Visibility(
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child: TextButton(
                      onPressed: (){
                        _listController.removeAt(index);
                        setState(() {
                        });
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: kRedLightColor, shape: CircleBorder()),
                      child: SvgPicture.asset(
                        "assets/icons/Delete.svg",
                        color: kRedDarkColor,
                      ),),),
              visible: (index + 1) != _listController.length,
            ),
            SizedBox(width: getProportionateScreenWidth(5),),
            Visibility(
              child: SizedBox(
                width: 40,
                height: 40,
                child: TextButton(
                  onPressed: (){
                    _listController.insert((index+1), TextEditingController());
                    setState(() {
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: kGreenLightColor, shape: CircleBorder()),
                  child: SvgPicture.asset(
                    "assets/icons/Add.svg",
                    color: kGreenDarkColor,
                  ),),),
              visible: index +1 == _listController.length,
            ),
          ],
        ),
      ],
    );
  }

}
