class Profile {
  final String _name;
  final String _secretKey;

  String get name => _name;
  String get securityKey => _secretKey;

  Profile(this._name, this._secretKey);
}
