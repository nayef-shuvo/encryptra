import 'dart:io';

import 'package:flutter/material.dart';

void saveFile(String path, var byteData) {
  try {
    File file = File(path);
    file.writeAsBytesSync(byteData);
  } catch (e) {
    throw Exception("Something happend.");
  }
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}