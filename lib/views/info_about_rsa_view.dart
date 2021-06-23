/// ---------------------------------------------------
import 'package:flutter/material.dart';

/// ---------------------------------------------------
class InfoAboutRsaView extends StatelessWidget {
  static final String routeName = '/Info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INFORMATION ABOUT RSA'),
      ),
      body: Center(
        child: Text('Information about RSA'),
      ),
    );
  }
}
