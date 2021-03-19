
import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/buttons/button.dart';

// ignore: must_be_immutable
class BlueButton extends StatelessWidget {

  String label;

  Function onPressed;

  BlueButton(this.label, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Button(
      label,
      onPressed: onPressed,
      color: Colors.blue,
      fontColor: Colors.white,
    );
  }

}