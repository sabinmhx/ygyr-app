import 'package:ygyr/base/extension/regex.dart';

/// Class for validating text fields.
///
/// Following are the methods inside [TextFieldValidator] class:
///* [validateIdField]
///* [validateEmptyField]
///* [validateEmailField]
///* [validatePasswordField]
///
class TextFieldValidator {
  /// Validates the ID field and returns null if validation is successful;
  /// otherwise, returns a string error message.
  ///
  /// Validation is based on:
  ///   - Whether the field is empty or non-empty
  ///   - The length of the value
  ///   - Additional criteria (such as accepting only numbers)
  ///
  /// Returns:
  ///   - Null if validation succeeds
  ///   - String error message if validation fails
  static String? validateIdField(String? value) {
    if (value.isNullOrEmpty) {
      return 'Required Field';
    } else if (value!.isExceptNumber) {
      return 'Number is only accepted';
    } else if (value.length < 10) {
      return 'Required length is 10';
    }
    return null;
  }

  /// Validates whether the field is empty or not.
  ///
  /// Returns:
  ///   - Null if the field is not empty
  ///   - 'Required Field' if the field is empty
  static String? validateEmptyField(String? value) {
    if (value.isNullOrEmpty) {
      return 'Required Field';
    } else {
      return null;
    }
  }

  /// Validates the Password field and returns null if validation is successful; otherwise, returns a string error message.
  ///
  /// Validation is based on:
  ///   - Whether the field is empty or non-empty
  ///   - The presence of at least one lowercase character
  ///   - The presence of at least one uppercase character
  ///   - The presence of at least one number
  ///   - The presence of at least one special character
  ///   - The length of the value
  ///
  /// Returns:
  ///   - Null if validation succeeds
  ///   - String error message if validation fails
  static String? validatePasswordField(String? value) {
    return null;
    // if (value.isNullOrEmpty) {
    //   return 'Required Field';
    // } else if (!value!.isLowerCaseOnly) {
    //   return ' Atleast one lower case is required';
    // } else if (!value.isUpperCaseOnly) {
    //   return ' Atleast one upper case is required';
    // } else if (!value.isNumberOnly) {
    //   return ' Atleast one number is required';
    // } else if (!value.isSpecialCharactersOnly) {
    //   return ' Atleast one special characters is required';
    // } else if (value.length < 8) {
    //   return 'Required length is 8';
    // } else {
    //   return null;
    // }
  }

  /// Validates the Email field and returns null if validation is successful; otherwise, returns a string error message.
  ///
  /// Validation is based on:
  ///   - Whether the field is empty or non-empty
  ///   - The format of the email address
  ///
  /// Returns:
  ///   - Null if validation succeeds
  ///   - 'Wrong Email Format' if the email format is incorrect
  ///   - 'Required Field' if the field is empty
  static String? validateEmailField(String? value) {
    if (value.isNullOrEmpty) {
      return 'Required Field';
    } else if (!value!.isEmailValid) {
      return 'Wrong Email Format';
    } else {
      return null;
    }
  }

  /// Validates name field and return null if validation is successful;
  /// otherwise, return specific message.
  ///
  /// Validation is based on:
  ///  - Whether the field is empty or non-empty.
  ///  - The format of the name.
  /// Returns:
  ///   - Null if validation succeeds.
  ///   - 'Only String is allowed' if the name format is incorrect.
  ///   - 'Required Field' if the field is empty.
  static String? validateNameField(String? value) {
    if (value.isNullOrEmpty) {
      return 'Required Field';
    } else if (!value!.isNameValid) {
      return "Only String is allowed";
    } else {
      return null;
    }
  }

  /// Validates postal code field and return null if validation is successful;
  /// otherwise, return specific message.
  ///
  /// Validation is based on:
  ///  - Whether the field is empty or non-empty.
  ///  - The format of the postal code.
  /// Returns:
  ///   - Null if validation succeeds.
  ///   - 'Invalid postal code' if the length don't matches.
  ///   - 'Required Field' if the field is empty.
  static String? validatePostalCode(String? value) {
    if (value.isNullOrEmpty) {
      return "Required Field";
    } else if (value!.length != 5) {
      return "Invalid postal code";
    } else {
      return null;
    }
  }

  /// Validates phone number field and return null if validation is successful;
  /// otherwise, return specific message.
  ///
  /// Validation is based on:
  ///  - Whether the field is empty or non-empty.
  ///  - The number of digits in phone number.
  /// Returns:
  ///   - Null if validation succeeds.
  ///   - 'Phone Number should be of 10 digits' warning if the length don't matches.
  ///   - 'Required Field' if the field is empty.
  static String? validatePhoneNumber(String? value) {
    if (value.isNullOrEmpty) {
      return "Required Field";
    } else if (value?.length != 10) {
      return "Phone Number should be of 10 digits";
    } else {
      return null;
    }
  }
}
