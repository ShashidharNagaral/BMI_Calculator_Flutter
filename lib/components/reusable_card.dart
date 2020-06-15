import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.all(
            Radius.circular(kCardRadius),
          ),
        ),
        margin: EdgeInsets.only(
          top: kCardMargin,
          left: kCardMargin,
          right: kCardMargin,
        ),
        padding: EdgeInsets.all(8.0),
      ),
    );
  }

  final Function onTap;
  final Color colour;
  final Widget cardChild;
}
