import 'dart:math';

class Hashing {
  final String _name;
  final String _hash;

  Hashing(this._name, this._hash);

  String generateHash() {
    const int RANDOM_CHARACTER = 3;

    Random.secure().nextInt(10);
    return "abc";
  }
}
