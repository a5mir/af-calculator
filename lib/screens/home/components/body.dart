import 'package:af_calculator/components/default_dialog.dart';
import 'package:af_calculator/components/default_dropdown_button.dart';
import 'package:af_calculator/components/default_text_field.dart';
import 'package:af_calculator/constants.dart';
import 'package:af_calculator/model/offer.dart';
import 'package:af_calculator/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forex_conversion/forex_conversion.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final fx = Forex();
  double totalCharges = 0;
  bool isLoading = false;
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
  var _addButtonController = TextEditingController();

  String svAF = "USD";
  String svOC = "USD";
  String svOCpkg = "USD";
  String svDC = "USD";
  String svDCpkg = "USD";
  String svOTC = "USD";
  String svOTCpkg = "USD";

  double eurusd = 0;

  @override
  Widget build(BuildContext context) {
    fx.getCurrencyConverted("USD", "EUR", 1).then((value) => eurusd = value);
    return Scaffold(
      floatingActionButton: Row(
        //mainAxisSize: MainAxisSize.max,
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
                  setState(() {
                    isLoading = true;
                    changeAddButtonValue();
                  });
                },
                child: !isLoading
                    ? SvgPicture.asset(
                        "assets/icons/Refresh.svg",
                        color: kBlueDarkColor,
                      )
                    : SizedBox(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: kBlueDarkColor,
                          ),
                        ),
                        width: getProportionateScreenWidth(15),
                        height: getProportionateScreenHeight(15),
                      )),
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          SizedBox(
            height: getProportionateScreenHeight(56),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(56),
                ),
                primary: kRedDarkColor,
                backgroundColor: kRedLightColor,
              ),
              onPressed: () {
                _clearTextFields();
                changeAddButtonValue();
              },
              child: SvgPicture.asset(
                "assets/icons/Clear.svg",
                color: kRedDarkColor,
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
                  primary: kGreenDarkColor,
                  backgroundColor: kGreenLightColor),
              onPressed: () {
                addButtonOnPressed();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/Add.svg",
                    color: kGreenDarkColor,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 100),
                    child: Text(
                      "$totalCharges EUR",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                          color: kGreenDarkColor, fontWeight: FontWeight.bold),
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
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          changeAddButtonValue();
        },
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
                    Expanded(
                        child: DefaultTextField(
                      labelText: "AOL",
                      textEditingController: _aolController,
                    )),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Expanded(
                        child: DefaultTextField(
                      labelText: "AOD",
                      textEditingController: _aodController,
                    )),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                DefaultTextField(
                  labelText: "CHARGEABLE WEIGHT (kg)",
                  textEditingController: _cwController,
                  textInputType: TextInputType.number,
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
                    Expanded(
                        flex: 40,
                        child: DefaultDropdownButton(
                          valueReturned: _handleValueReturned,
                          nod: "AF",
                        )),
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
                    Expanded(
                        flex: 40,
                        child: DefaultDropdownButton(
                          valueReturned: _handleValueReturned,
                          nod: "OC",
                        )),
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
                    Expanded(
                        flex: 40,
                        child: DefaultDropdownButton(
                          valueReturned: _handleValueReturned,
                          nod: "OK",
                        )),
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
                    Expanded(
                        flex: 40,
                        child: DefaultDropdownButton(
                          valueReturned: _handleValueReturned,
                          nod: "DC",
                        )),
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
                    Expanded(
                        flex: 40,
                        child: DefaultDropdownButton(
                          valueReturned: _handleValueReturned,
                          nod: "DK",
                        )),
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
                    Expanded(
                        flex: 40,
                        child: DefaultDropdownButton(
                          valueReturned: _handleValueReturned,
                          nod: "TC",
                        )),
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
                    Expanded(
                        flex: 40,
                        child: DefaultDropdownButton(
                          valueReturned: _handleValueReturned,
                          nod: "TK",
                        )),
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

  void changeAddButtonValue() {
    setState(() {
      FocusManager.instance.primaryFocus?.unfocus();
      currentCharges().then((_) => setState(() {
            _addButtonController.text = "$totalCharges";
            isLoading = false;
          }));
    });
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

  bool checkValue() {
    if (_ocController.text.isEmpty) {
      _ocController.text = "0.00";
    }
    if (_ocpkgController.text.isEmpty) {
      _ocpkgController.text = "0.00";
    }
    if (_dcController.text.isEmpty) {
      _dcController.text = "0.00";
    }
    if (_dcpkgController.text.isEmpty) {
      _dcpkgController.text = "0.00";
    }
    if (_otcController.text.isEmpty) {
      _otcController.text = "0.00";
    }
    if (_otcpkgController.text.isEmpty) {
      _otcpkgController.text = "0.00";
    }

    if (_aolController.text.isEmpty ||
        _aodController.text.isEmpty ||
        _cwController.text.isEmpty ||
        _afController.text.isEmpty) {
      return false;
    }

    if (double.tryParse(_cwController.text) == null ||
        double.tryParse(_afController.text) == null ||
        double.tryParse(_ocController.text) == null ||
        double.tryParse(_ocpkgController.text) == null ||
        double.tryParse(_dcController.text) == null ||
        double.tryParse(_dcpkgController.text) == null ||
        double.tryParse(_otcController.text) == null ||
        double.tryParse(_otcpkgController.text) == null) {
      return false;
    }

    return true;
  }

  Offer? createOffer() {
    if (checkValue() == true) {
      return Offer(
          aol: _aolController.text.trim().toUpperCase(),
          aod: _aodController.text.trim().toUpperCase(),
          af: double.parse(_afController.text),
          cw: double.parse(_cwController.text),
          oc: double.parse(_ocController.text),
          ocpkg: double.parse(_ocpkgController.text),
          dc: double.parse(_dcController.text),
          dcpkg: double.parse(_dcpkgController.text),
          otc: double.parse(_otcController.text),
          otcpkg: double.parse(_otcpkgController.text),
          value: totalCharges);
    }
    return null;
  }

  void addButtonOnPressed() {
    FocusManager.instance.primaryFocus?.unfocus();
    Offer? offer = createOffer();
    if (offer != null) {
      offerList.add(offer);
      DefaultDialog.defaultDialog(
          primaryColor: kGreenLightColor,
          secondaryColor: kGreenDarkColor,
          icon: "assets/icons/Check.svg",
          headerText: "DONE",
          bodyText: "The offer has been successfully added to the list!",
          context: context);
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

  Future<void> currentCharges() async {
    if (_cwController.text.isNotEmpty &&
        double.tryParse(_cwController.text) != null) {
      double cw = double.parse(_cwController.text);
      double af = (_afController.text.isNotEmpty &&
              double.tryParse(_afController.text) != null)
          ? double.parse(_afController.text)
          : 0;
      double dc = (_dcController.text.isNotEmpty &&
              double.tryParse(_dcController.text) != null)
          ? double.parse(_dcController.text)
          : 0;
      double dcpkg = (_dcpkgController.text.isNotEmpty &&
              double.tryParse(_dcpkgController.text) != null)
          ? double.parse(_dcpkgController.text)
          : 0;
      double oc = (_ocController.text.isNotEmpty &&
              double.tryParse(_ocController.text) != null)
          ? double.parse(_ocController.text)
          : 0;
      double ocpkg = (_ocpkgController.text.isNotEmpty &&
              double.tryParse(_ocpkgController.text) != null)
          ? double.parse(_ocpkgController.text)
          : 0;
      double otc = (_otcController.text.isNotEmpty &&
              double.tryParse(_otcController.text) != null)
          ? double.parse(_otcController.text)
          : 0;
      double otcpkg = (_otcpkgController.text.isNotEmpty &&
              double.tryParse(_otcpkgController.text) != null)
          ? double.parse(_otcpkgController.text)
          : 0;

      (svAF == "USD")
          ? af = af * eurusd
          : (svAF == "BAM")
              ? af = af / 1.95583
              : af;
      (svOC == "USD")
          ? oc = oc * eurusd
          : (svOC == "BAM")
              ? oc = oc / 1.95583
              : oc;
      (svOCpkg == "USD")
          ? ocpkg = ocpkg * eurusd
          : (svOCpkg == "BAM")
              ? ocpkg = ocpkg / 1.95583
              : ocpkg;
      (svDC == "USD")
          ? dc = dc * eurusd
          : (svDC == "BAM")
              ? dc = dc / 1.95583
              : dc;
      (svDCpkg == "USD")
          ? dcpkg = dcpkg * eurusd
          : (svDCpkg == "BAM")
              ? dcpkg = dcpkg / 1.95583
              : dcpkg;
      (svOTC == "USD")
          ? otc = otc * eurusd
          : (svOTC == "BAM")
              ? otc = otc / 1.95583
              : otc;
      (svOTCpkg == "USD")
          ? otcpkg = otcpkg * eurusd
          : (svOTCpkg == "BAM")
              ? otcpkg = otcpkg / 1.95583
              : otcpkg;

      totalCharges =
          af * cw + dcpkg * cw + ocpkg * cw + otcpkg * cw + dc + oc + otc;
      totalCharges = double.parse(totalCharges.toStringAsExponential(2));
    } else {
      totalCharges = 0;
    }
  }

  _handleValueReturned(String value) {
    String fValue = value.substring(0, 3);
    String lValue = value.substring(3, 5);

    switch (lValue) {
      case "AF":
        svAF = fValue;
        break;
      case "OC":
        svOC = fValue;
        break;
      case "OK":
        svOCpkg = fValue;
        break;
      case "DC":
        svDC = fValue;
        break;
      case "DK":
        svDCpkg = fValue;
        break;
      case "TC":
        svOTC = fValue;
        break;
      case "TK":
        svOTCpkg = fValue;
        break;
    }
  }


}
