import 'dart:io';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

import 'profile.dart';

class Encryption extends Profile {
  final _ivLength = 16;
  final _fileType = 'aes';

  Encryption({required String username, required String secretKey})
      : super(username, secretKey);

  List<int> encryptData(String path) {
    var byteData = <int>[];
    try {
      File file = File(path);
      byteData = file.readAsBytesSync();
    } catch (e) {
      throw Exception("File doen't found.");
    }
    final key = Key.fromUtf8(secretKey);
    final iv = IV.fromLength(_ivLength);
    final encrypter = Encrypter(AES(key));

    final encryptedData = encrypter.encryptBytes(byteData, iv: iv);

    return encryptedData.bytes;
  }

  List<int> decryptData(String path) {
    if (path.split('.').last != _fileType) {
      throw Exception("Unsupported media type.");
    }
    var byteData = <int>[];
    try {
      File file = File(path);
      byteData = file.readAsBytesSync();
    } catch (e) {
      throw Exception("File doesn't found.");
    }
    final key = Key.fromUtf8(secretKey);
    final iv = IV.fromLength(_ivLength);

    final encrypter = Encrypter(AES(key));

    final bytes = Encrypted(Uint8List.fromList(byteData));
    final decryptedData = encrypter.decryptBytes(bytes, iv: iv);

    return decryptedData;
  }
}