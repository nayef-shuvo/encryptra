import 'dart:io';

void saveFile(String path, var byteData) {
  try {
    File file = File(path);
    file.writeAsBytesSync(byteData);
  } catch (e) {
    throw Exception("Something happend.");
  }
}