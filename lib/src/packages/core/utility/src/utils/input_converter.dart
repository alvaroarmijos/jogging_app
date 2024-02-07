import 'package:tracking_app/src/packages/core/utility/utility.dart';

class InputConverter {
  int stringToUnsignedInteger(String str) {
    try {
      final integer = int.parse(str);

      if (integer < 0) throw const FormatException();

      return integer;
    } on FormatException {
      throw const InvalidAgeException();
    }
  }

  double stringToUnsignedDouble(String str) {
    try {
      final doubleValue = double.parse(str);

      if (doubleValue < 0) throw const FormatException();

      return doubleValue;
    } on FormatException {
      throw const InvalidWeightException();
    }
  }

  bool validateEmail(String email) {
    final isValidEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!isValidEmail) throw const InvalidEmailException();

    return true;
  }
}
