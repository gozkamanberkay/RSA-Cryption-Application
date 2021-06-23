/// ---------------------------------------------------
import 'package:flutter/material.dart';
import 'package:myapp/rsa_operations.dart';
import 'package:myapp/widgets/button_widget.dart';
import 'package:myapp/views/message_input_view.dart';

/// ---------------------------------------------------
class KeyPairDisplayView extends StatelessWidget {
  static final String routeName = '/KeyPairDisplay';

  @override
  Widget build(BuildContext context) {
    RSA rsa = ModalRoute.of(context).settings.arguments;
    // print(rsa.phi);

    return Scaffold(
      appBar: AppBar(
        title: Text('KEYPAIR DISPLAY VIEW'),
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
                    'PUBLIC KEY',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    // TODO
                    // rsa.getStringValueOfPublicKey(),
                    'PUBLIC KEY VALUE',
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
                    'PRIVATE KEY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    // TODO
                    // rsa.getStringValueOfPrivateKey(),
                    'PRIVATE KEY VALUE',
                    style: TextStyle(
                      fontSize: 24,
                    ),
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
