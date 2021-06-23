/// ---------------------------------------------------
import 'package:flutter/material.dart';
import 'package:myapp/views/parameters_input_view.dart';
import 'package:myapp/widgets/button_widget.dart';
import 'package:myapp/views/info_about_rsa_view.dart';

/// ---------------------------------------------------
class HomeView extends StatelessWidget {
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RSA CRYPTION APP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonWidget(
              text: 'KEY GENERATOR / CRYPTOR',
              onPressed: () {
                Navigator.pushNamed(context, ParametersInputView.routeName);
              },
            ),
            ButtonWidget(
              text: 'INFORMATION ABOUT RSA',
              onPressed: () {
                Navigator.pushNamed(context, InfoAboutRsaView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
