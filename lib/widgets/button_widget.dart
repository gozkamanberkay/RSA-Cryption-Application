/// ---------------------------------------------------
import 'package:flutter/material.dart';

/// ---------------------------------------------------
class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;

  const ButtonWidget({
    @required this.text,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 35,
      margin: EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
