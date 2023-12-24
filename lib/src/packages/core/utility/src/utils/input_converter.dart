import 'package:tracking_app/src/packages/data/account/account.dart';

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
      final doubleValue = double.parse(str.replaceAll(',', '.'));
      if (doubleValue < 0) throw const FormatException();
      return doubleValue;
    } on FormatException {
      throw const InvalidWeightException();
    }
  }
}
