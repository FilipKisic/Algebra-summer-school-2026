class FormValidator {
  static String? validateEmail(final String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some value';
    }

    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value)) {
      return 'Please enter valid email address.';
    }

    return null;
  }

  static String? validatePassword(final String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some value';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    }

    return null;
  }

  static String? validateConfirmPassword(final String? value, final String? original) {
    if (value == null || value.isEmpty) {
      return 'Please enter some value';
    }

    if (value != original) {
      return 'Passwords do not match.';
    }
    return null;
  }
}