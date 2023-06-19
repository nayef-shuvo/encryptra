abstract class Constant {
  static final upperCases = List<String>.generate(26, (index) {
    String first = 'A';
    int ascii = first.codeUnitAt(0);
    String value = String.fromCharCode(ascii + index);
    return value;
  });

  static final lowerCases = List<String>.generate(26, (index) {
    String first = 'a';
    int ascii = first.codeUnitAt(0);
    String value = String.fromCharCode(ascii + index);
    return value;
  });

  static final numbers = List.generate(10, (index) => index.toString());

  // Allowed special characters
  static final specialCharacters = ['!', '@', '#', '\$', '%', '^', '&', '*'];
}
