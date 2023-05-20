import 'package:flutter/material.dart';

import '../constant.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.screenWidth,
      required this.label,
      this.backgroundColor,
      this.textColor,
      this.borderColor //yo sab constructor pass haneko
      });

  final double screenWidth;
  String label;
  Color? backgroundColor, textColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth,
        padding: const EdgeInsets.symmetric(
            vertical: 15), //yo sign in laii thulo banako
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
                color: borderColor ?? primary,
                width:
                    2), //?? le chaii yedi color nullable xa vanye chaii bordercolor primary pass gare vaneko
            borderRadius: BorderRadius.all(Radius.circular(
                10))), //side ma thoraii sign in ko box circular banako
        child: Text(label,
            textAlign: TextAlign.center, style: TextStyle(color: textColor)));
  }
}
