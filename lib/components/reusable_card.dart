import "package:flutter/material.dart";

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {required this.cardColor, this.cardChild, this.handleAction, super.key});

  final Color cardColor;
  final Widget? cardChild;
  final Function? handleAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        handleAction!();
      },
      child: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cardColor,
          ),
          child: cardChild),
    );
  }
}
