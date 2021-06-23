/// ---------------------------------------------------
import 'package:flutter/material.dart';
import 'package:myapp/widgets/button_widget.dart';
import 'package:myapp/widgets/input_parameter_widget.dart';
import 'package:myapp/views/keypair_display_view.dart';
import 'package:myapp/rsa_operations.dart';

/// ---------------------------------------------------
class ParametersInputView extends StatelessWidget {
  static String routeName = '/ParametersInputView';

  static final controllerP = TextEditingController();
  static final controllerQ = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int p;
    int q;
    RSA rsa;

    return Scaffold(
      appBar: AppBar(
        title: const Text('PARAMETERS INPUT VIEW'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'PARAMETERS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            InputParameterWigdet(
              labelText: 'p',
              hintText: 'Enter a prime number',
              controller: controllerP,
            ),
            InputParameterWigdet(
              labelText: 'q',
              hintText: 'Enter a prime number',
              controller: controllerQ,
            ),
            ButtonWidget(
              text: 'GENERATE KEYPAIR',
              onPressed: () {
                p = int.parse(controllerP.text);
                q = int.parse(controllerQ.text);

                rsa = RSA(p, q);

                Navigator.pushNamed(
                  context,
                  KeyPairDisplayView.routeName,
                  arguments: rsa,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
