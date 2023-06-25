import 'package:encryptra/utils/custom_theme.dart';
import 'package:encryptra/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Encrypta',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.theme(context),
      home: const HomePage(),
    );
  }
}
