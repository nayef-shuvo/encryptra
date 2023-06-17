import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (Theme.of(context).platform == TargetPlatform.android ||
          Theme.of(context).platform == TargetPlatform.iOS) {
        return const Scaffold(
          body: Center(child: Text("This is Android")),
          backgroundColor: Colors.red,
        );
      } else {
        return const Scaffold(
          backgroundColor: Colors.blue,
        );
      }
    });
  }
}
