/// ---------------------------------------------------
import 'package:flutter/material.dart';

/// ---------------------------------------------------
class InputParameterWigdet extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const InputParameterWigdet({
    @required this.labelText,
    @required this.hintText,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 50.0,
        right: 50.0,
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        maxLength: 5,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          labelText: labelText,
          hintText: hintText,
        ),
        controller: controller,
      ),
    );
  }
}
