import 'dart:math' as math show pi;

extension NumExtensions on num {
  /// Adds comma on every three digits on numbers.
  String get asThousands {
    String number = toString();
    List<String> splitNumberOnPoint = number.split('.');
    String numberWithoutDecimals = splitNumberOnPoint[0];
    String numberDecimals = splitNumberOnPoint[1];
    String numberInText = '';
    int counter = 0;
    for (int i = (numberWithoutDecimals.length - 1); i >= 0; i--) {
      counter++;
      String str = numberWithoutDecimals[i];
      if ((counter % 3) != 0 && i != 0) {
        numberInText = '$str$numberInText';
      } else if (i == 0) {
        numberInText = '$str$numberInText';
      } else {
        numberInText = ',$str$numberInText';
      }
    }
    // Remove whitespace at leading or trailing with trim method.
    numberInText = numberInText.trim();
    return '$numberInText.$numberDecimals';
  }

  /// Converts Degree to Radian.
  double get degreeToRadian => this * math.pi / 180;

  /// Converts Radian to Degree.
  double get radianToDegree => this * 180 / math.pi;
}
