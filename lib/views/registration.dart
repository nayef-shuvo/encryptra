import 'package:encryptra/models/hashing.dart';
import 'package:encryptra/models/profile.dart';
import 'package:encryptra/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/constant.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _keyController = TextEditingController();

  bool _isObscure = true;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _keyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.red[100]!,
                Colors.purple[100]!,
              ]),
        ),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "W E L C O M E",
                  style: GoogleFonts.ysabeau(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "T O",
                  style: GoogleFonts.ysabeau(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "E N C R Y P T R A",
                  style: GoogleFonts.ysabeau(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customTextField(_nameController, "Username"),
                    customTextField(_keyController, "Secret Key", isKey: true),
                    ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('Processing Data')),
                        //   );
                        // }
                        if (_formKey.currentState!.validate()) {
                          var profile = Profile(
                              _nameController.text, _keyController.text);
                          var hash = Hashing(profile.secretKey);
                          //* write a function that stores hash and key
                        }
                      },
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : const Text("O K"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextField(TextEditingController controller, String label,
      {bool isKey = false}) {
    const textFieldSizeRatio = .4;
    const minKeyLength = 8;
    const minNameLength = 4;

    String? inputValidation(String? value) {
      if (isKey) {
        if (value == null || value.length < minKeyLength) {
          return "Key must have at least $minKeyLength characters";
        }
        bool hasNumber = false;
        bool hasLowerCase = false;
        bool hasUpperCase = false;
        bool hasSpecialChar = false;

        for (int i = 0; i < value.length; i++) {
          var char = value[i];
          if (Constant.numbers.contains(char)) hasNumber = true;
          if (Constant.lowerCases.contains(char)) hasLowerCase = true;
          if (Constant.upperCases.contains(char)) hasUpperCase = true;
          if (Constant.specialCharacters.contains(char)) hasSpecialChar = true;
        }
        if (!hasNumber) {
          return "Must contain at least 1 digit [0-9]";
        }
        if (!hasLowerCase) {
          return "Must contain at least 1 lowercase letter [a-z]";
        }
        if (!hasUpperCase) {
          return "Must contain at least 1 uppercase letter [A-Z]";
        }
        if (!hasSpecialChar) {
          return "Must contain at least 1 special character";
        }
      } else {
        if (value == null || value.length < minNameLength) {
          return "Username must have at least $minNameLength characters";
        }
      }

      return null;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ),
      child: SizedBox(
        height: 80,
        width: getWidth(context) * textFieldSizeRatio,
        child: TextFormField(
          controller: controller,
          obscureText: isKey & _isObscure,
          validator: (value) => inputValidation(value),
          decoration: InputDecoration(
            // isDense: true,
            labelText: label,
            suffix: isKey
                ? IconButton(
                    icon: _isObscure
                        ? const Icon(Icons.visibility_off_sharp)
                        : const Icon(Icons.visibility_sharp),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
