import 'package:af_calculator/constants.dart';
import 'package:af_calculator/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultDropdownButton extends StatefulWidget {
  var _currency = ["USD", "EUR", "BAM"];
  String _dValue = "null";
  final Function(String)? valueReturned;
  String nod;

  DefaultDropdownButton({
    Key? key,
    this.valueReturned,
    required this.nod,
  }) : super(key: key);


  @override
  State<DefaultDropdownButton> createState() => _DefaultDropdownButtonState();
}

class _DefaultDropdownButtonState extends State<DefaultDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      shadowColor: Colors.black54,
      borderRadius: BorderRadius.circular(4),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          icon: SvgPicture.asset(
            "assets/icons/Arrow.svg",
            height: getProportionateScreenHeight(25),
            width: getProportionateScreenWidth(25),
          ),
          items: widget._currency.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          dropdownColor: kBackgroundColor,
          decoration: InputDecoration(
              labelText: "CURRENCY",
              floatingLabelStyle: TextStyle(
                backgroundColor: kBackgroundColor,
                color: Colors.black54,
              ),
              floatingLabelBehavior:
              FloatingLabelBehavior.always,
              filled: true,
              fillColor: kBackgroundColor,
              contentPadding: EdgeInsets.fromLTRB(15, 0, 20, 0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                    color: kPrimaryLightColor, width: 2.0),
              )),
          hint: widget._dValue == "null"
              ? Text(
            widget._currency[0],
            style: TextStyle(
              color: Colors.black,
            ),
          )
              : Text(
            widget._dValue,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            setState(() {
              widget._dValue = val!;
              widget.valueReturned!(val+widget.nod);
              });
          },
        ),
      ),
    );
  }
}
