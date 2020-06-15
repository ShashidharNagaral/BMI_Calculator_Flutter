import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomButton({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(kCardMargin),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              buttonTitle,
              style: kCalTextStyle,
            ),
          ),
        ),
        color: kBottomContainerColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kCardRadius)),
        ),
      ),
    );
  }
}
