class Profile {
  final _keyLength = 32;

  final String _username;
  String _secretKey;

  Profile(this._username, this._secretKey) {
    int gapLength = _keyLength - _secretKey.length;
    for (int i = 0; i < gapLength; i++) {
      _secretKey += _secretKey[i];
    }
  }

  String get username => _username;
  String get secretKey => _secretKey;
}
