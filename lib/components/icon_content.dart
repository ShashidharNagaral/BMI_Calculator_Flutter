import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class IconContent extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: kIconSize,
          color: colour,
        ),
        SizedBox(
          height: kGap,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: kLabelSize,
            color: colour,
          ),
        )
      ],
    );
  }

  IconContent({
    @required this.iconData,
    @required this.label,
    @required this.colour,
  });
}
