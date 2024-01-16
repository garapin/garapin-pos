class FormValidation {
  static bool isEmailValid(String email) {
    const emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    final regExp = RegExp(emailPattern);

    return regExp.hasMatch(email);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    const phonePattern =
        r'^08\d{8,}$'; // Memeriksa awalan "08" dan minimal 8 digit
    final regExp = RegExp(phonePattern);

    return regExp.hasMatch(phoneNumber);
  }

  static bool isPasswordValid(String password) {
    if (password.length < 8) {
      return false;
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return false;
    }

    if (!password.contains(RegExp(r'[a-z]'))) {
      return false;
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return false;
    }

    if (!password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      return false;
    }

    return true;
  }
}
