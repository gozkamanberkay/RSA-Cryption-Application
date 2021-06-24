/// ---------------------------------------------------
import 'package:flutter/material.dart';
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

    /// Wheter this route is the top-most route on the navigator.
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
                  Text(
                    'ASCII',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    asciiText,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ENCRYPTED',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    encryptedText,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'DECRYPTED',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    decryptedText,
                    style: TextStyle(
                      fontSize: 24,
                    ),
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
