class Validators {
  static String? emailValidator(String value) {
    return value.isNotEmpty && value.contains('@')
        ? null
        : 'Enter a valid email';
  }

  static String? passwordValidator(String value) {
    return value.length >= 6 ? null : 'Password must be at least 6 characters';
  }

  static String? notEmptyValidator(String value) {
    return value.isNotEmpty ? null : 'This field cannot be empty';
  }
}
