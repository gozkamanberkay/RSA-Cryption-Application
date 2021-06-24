/// ---------------------------------------------------
import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/rsa_operations.dart';
import 'package:myapp/widgets/button_widget.dart';
import 'package:myapp/views/message_input_view.dart';

/// ---------------------------------------------------
class KeyPairDisplayView extends StatelessWidget {
  static final String routeName = '/KeyPairDisplayView';

  @override
  Widget build(BuildContext context) {
    RSA rsa = ModalRoute.of(context).settings.arguments;

    String stringValueOfPublicKey = '';
    String stringValueOfPrivateKey = '';

    /// Wheter this route is the top-most route on the navigator.
    if (ModalRoute.of(context).isCurrent) {
      stringValueOfPublicKey = rsa.getStringValueOfPublicKey();
      stringValueOfPrivateKey = rsa.getStringValueOfPrivateKey();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('KEYPAIR DISPLAY'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: Constants.instance.padding,
                    child: Text(
                      'PUBLIC KEY',
                      style: Constants.instance.headlineStyle,
                    ),
                  ),
                  Text(
                    stringValueOfPublicKey,
                    style: Constants.instance.contextStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: Constants.instance.padding,
                    child: Text(
                      'PRIVATE KEY',
                      style: Constants.instance.headlineStyle,
                    ),
                  ),
                  Text(
                    stringValueOfPrivateKey,
                    style: Constants.instance.contextStyle,
                  ),
                ],
              ),
            ),
            ButtonWidget(
              text: 'ENCRYPTER / DECRYPTER',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  MessageInputView.routeName,
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
