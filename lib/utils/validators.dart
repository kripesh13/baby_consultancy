// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'dart:io';

class Validators {
  static String? email(String? input) {
    if (input!.isEmpty) {
      return "Email Address cannot be empty.";
    }
    bool isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input);
    if (!isValid) {
      return "Email Address is Not Valid";
    }
    return null;
  }

  static String? isRequired(String? input) {
    if (input == null || input.isEmpty) {
      return "This is a required field.";
    }
    return null;
  }

  static String? image(File? input) {
    if (input == null || input.path.isEmpty) {
      return "This is a required field.";
    }
    return null;
  }

  static String? dateTime(DateTime? input) {
      if (input == null) {
        return "This is a required fields.";
      }
      return null;
  }

  static String? dateTimeBefore({DateTime? start, DateTime? end}) {
    if (end == null) {
      return null;
    } else if (start == null) {
      return "Please fill Start Date first";
    } else if (end.isBefore(start)) {
      return "End date cannot be before start date";
    }
    return null;
  }

  static String? name(String? input) {
    if (input!.isEmpty) {
      return "Full Name cannot be empty.";
    }
    if (input.length < 2) {
      return "Full Name is Not Valid";
    }
    return null;
  }

  static String? password(String? input) {
    if (input!.isEmpty) {
      return "Password cannot be empty.";
    }
    if (input.length < 8) {
      return "Password cannot be less then 8 characters.";
    }
    return null;
  }

  static String? confirmPassword(String? input, String newPassword) {
    if (input!.isEmpty) {
      return "Password cannot be empty.";
    }
    if (input != newPassword) {
      return "Password did not match.";
    }
    return null;
  }

  static String? phone(String? input) {
    if (input!.isEmpty) {
      return "Enter a phone number";
    }
    bool isValid = RegExp(r'^9\d{8,9}$').hasMatch(input);
    if (!isValid) {
      return "Enter a valid phone number";
    }
    return null;
  }

  // static String? contact(String? input) {
  //   if (input!.isEmpty) {
  //     return "Contact number can not be blank";
  //   } else if (isNumeric(input) == false) {
  //     return "Contact number can not be string";
  //   } else if (input.length < 8 || input.length > 10) {
  //     return "Contact number should be between 8 and 10";
  //   } else if (input[0] != "0" || input[0] != "9") {
  //     return "Contact number should be start with 0 or 9";
  //   } else {
  //     return null;
  //   }
  // }

  static bool isNumeric(String? str) {
    try {
      var input = int.parse(str!);
      log("$input");
      return true;
    } on FormatException {
      return false;
    }
  }

  //expiry date validators

  static String? validateExpiryDate(String? value) {
    if (value!.isEmpty) {
      return 'This is required field';
    }

    int year;
    int month;
    // The value contains a forward slash if the month and year has been
    // entered.
    if (value.contains(RegExp(r'(\/)'))) {
      var split = value.split(RegExp(r'(\/)'));
      // The value before the slash is the month while the value to right of
      // it is the year.
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      // Only the month was entered
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }

    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Expiry month is invalid';
    }

    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid year should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return 'Expiry year is invalid';
    }

    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }
    return null;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return !(year == null) && isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is less than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently, is greater than card's
    // year
    return fourDigitsYear < now.year;
  }

  static String? validateCVV(String? value) {
    if (value!.isEmpty) {
      return "This field is required";
    }

    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null;
  }
}
