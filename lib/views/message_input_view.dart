/// ---------------------------------------------------
import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/rsa_operations.dart';
import 'package:myapp/widgets/button_widget.dart';
import 'package:myapp/widgets/input_message_widget.dart';
import 'package:myapp/views/message_display_view.dart';

/// ---------------------------------------------------
class MessageInputView extends StatelessWidget {
  static String routeName = '/MessageInputView';

  static final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RSA rsa = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MESSAGE INPUT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: Constants.instance.padding,
              child: Text(
                'MESSAGE',
                style: Constants.instance.headlineStyle,
              ),
            ),
            InputMessageWigdet(
              controller: controller,
              hintText:
                  'Break your message into small pieces and enter only one word at a time',
            ),
            ButtonWidget(
              text: 'ENCRYPT / DECRYPT',
              onPressed: () {
                String plainText = controller.text;

                Navigator.pushNamed(
                  context,
                  MessageDisplayView.routeName,
                  arguments: {
                    'rsa': rsa,
                    'plainText': plainText,
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
