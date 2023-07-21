import "package:bmi_calculator_project/constants.dart";
import "package:flutter/material.dart";

class IconWidget extends StatelessWidget {
  const IconWidget({required this.icon, required this.text, super.key});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Icon(icon, size: 80.0),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          text,
          style: kLabelStyleText,
        )
      ],
    );
  }
}
