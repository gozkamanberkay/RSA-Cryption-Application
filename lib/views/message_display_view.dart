/// ---------------------------------------------------
import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/rsa_operations.dart';
import 'package:myapp/widgets/button_widget.dart';

/// ---------------------------------------------------
class MessageDisplayView extends StatelessWidget {
  static String routeName = '/MessageDisplayView';

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments as Map;

    RSA rsa;
    String plainText = '';
    String asciiText = '';
    String encryptedText = '';
    String decryptedText = '';

    /// Whether this route is the top-most route on the navigator.
    if (ModalRoute.of(context).isCurrent) {
      rsa = data['rsa'];
      plainText = data['plainText'];

      asciiText = rsa.getStringValueOfAscii(plainText);
      encryptedText = rsa.encrypt(plainText);
      decryptedText = rsa.decrypt(plainText);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('MESSAGE DISPLAY VIEW'),
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
                      'ASCII',
                      style: Constants.instance.headlineStyle,
                    ),
                  ),
                  Text(
                    asciiText,
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
                      'ENCRYPTED',
                      style: Constants.instance.headlineStyle,
                    ),
                  ),
                  Text(
                    encryptedText,
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
                      'DECRYPTED',
                      style: Constants.instance.headlineStyle,
                    ),
                  ),
                  Text(
                    decryptedText,
                    style: Constants.instance.contextStyle,
                  ),
                ],
              ),
            ),
            ButtonWidget(
              text: 'HOME VIEW',
              onPressed: () {
                Navigator.popUntil(
                  context,
                  (route) => route.isFirst,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
