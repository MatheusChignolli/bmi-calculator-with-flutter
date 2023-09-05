import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final String text;
  final bool selected;

  GenderButton({this.onPressed, this.icon, this.text, this.selected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).iconTheme.color,
              size: 100,
            ),
            Text(
              text,
              style: labelTextStyle,
            )
          ],
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor: selected
              ? MaterialStateProperty.all(Theme.of(context).focusColor)
              : MaterialStateProperty.all(Theme.of(context).primaryColorDark),
        ),
      ),
    );
  }
}
