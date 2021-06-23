/// ---------------------------------------------------
import 'package:flutter/material.dart';

/// ---------------------------------------------------
class InputMessageWigdet extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const InputMessageWigdet({
    @required this.controller,
    @required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      child: TextField(
        maxLines: 2,
        maxLength: 10,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        controller: controller,
      ),
    );
  }
}
