import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';


class Hashing {
  // Random byte size is 2
  final randomByteRange = 1 << 8;
  final String _secretKey;

  Hashing(this._secretKey);

  String generateHash({var allowRandomBytes = true}) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _key = utf8.encode(_secretKey);
    var randomBytes = <int>[];

    if (allowRandomBytes.runtimeType == bool) {
      randomBytes = List.generate(2, (index) {
        int random = Random.secure().nextInt(randomByteRange);
        return random;
      });
    } else if (allowRandomBytes.runtimeType == List<int>) {
      randomBytes = allowRandomBytes;
    } else {
      throw ArgumentError('Invalid argument type for allowRandomBytes.');
    }

    final key = [..._key, ...randomBytes, ..._key];

    final hmacSha256 = sha256.convert(key);
    final hmacSha512 = Hmac(sha512, key);
    final digest = hmacSha512.convert(hmacSha256.bytes);
    return digest.toString();
  }

  bool verifyKey(String targetHash) {
    for (int i = 0; i < randomByteRange; i++) {
      for (int j = 0; j < randomByteRange; j++) {
        var randomBytes = [i, j];
        var hash = generateHash(allowRandomBytes: randomBytes);
        if (hash == targetHash) {
          return true;
        }
      }
    }
    return false;
  }
}