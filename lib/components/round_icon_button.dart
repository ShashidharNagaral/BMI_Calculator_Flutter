import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {@required this.onTap,
      @required this.backgroundColor,
      this.onLongPress,
      this.onLongPressUp,
      this.icon,
      this.iconSize});

  final IconData icon;
  final Function onTap;
  final Function onLongPress;
  final Function onLongPressUp;
  final Color backgroundColor;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      onLongPressUp: onLongPressUp,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            icon,
            size: iconSize,
          ),
        ),
        color: backgroundColor,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            40.0,
          ),
        ),
      ),
    );
  }
}
