/// ---------------------------------------------------
/// Simple RSA Cryption App

/// ---------------------------------------------------
import 'package:flutter/material.dart';
import 'package:myapp/views/home_view.dart';
import 'package:myapp/views/parameters_input_view.dart';
import 'package:myapp/views/keypair_display_view.dart';
import 'package:myapp/views/message_input_view.dart';
import 'package:myapp/views/message_display_view.dart';
import 'package:myapp/views/info_about_rsa_view.dart';

/// ---------------------------------------------------
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeView.routeName: (context) => HomeView(),
        ParametersInputView.routeName: (context) => ParametersInputView(),
        KeyPairDisplayView.routeName: (context) => KeyPairDisplayView(),
        MessageInputView.routeName: (context) => MessageInputView(),
        MessageDisplayView.routeName: (context) => MessageDisplayView(),
        InfoAboutRsaView.routeName: (context) => InfoAboutRsaView(),
      },
      initialRoute: HomeView.routeName,
    );
  }
}
