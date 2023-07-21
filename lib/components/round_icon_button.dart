import "package:bmi_calculator_project/constants.dart";
import "package:flutter/material.dart";

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, this.icon, this.handleAction});
  final IconData? icon;
  final Function? handleAction;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        handleAction!();
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      fillColor: kRoundedButtonColor,
      elevation: 6.0,
      constraints: const BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      child: Icon(icon),
    );
  }
}
