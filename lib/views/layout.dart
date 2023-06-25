import 'package:encryptra/views/registration.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (Theme.of(context).platform == TargetPlatform.android ||
          Theme.of(context).platform == TargetPlatform.iOS) {
        return const RegistrationPage();
      } else {
        return const RegistrationPage();
      }
    });
  }
}
