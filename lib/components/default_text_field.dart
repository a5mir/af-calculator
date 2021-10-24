import 'package:af_calculator/constants.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  String labelText;

  DefaultTextField({
    required this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      shadowColor: Colors.black54,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        child: Row(
          children: [
            Expanded(child: TextFormField(
              decoration: InputDecoration(
                  labelText: labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryLight, width: 1.5),
                  ),
                  filled: true,
                  fillColor: kBackgroundColor,
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 20, 0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(color: kPrimaryLightColor, width: 2.0),
                  )
              ),
            ))
          ],
        ),
      ),
    );
  }
}
