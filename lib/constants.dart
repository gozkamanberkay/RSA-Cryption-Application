/// ---------------------------------------------------
import 'package:flutter/material.dart';

/// ---------------------------------------------------
class Constants {
  static Constants instance = Constants._init();
  Constants._init();

  final EdgeInsets padding = const EdgeInsets.all(8.0);

  final TextStyle contextStyle = const TextStyle(fontSize: 24);

  final TextStyle headlineStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
