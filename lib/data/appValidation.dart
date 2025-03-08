class AppValidations {
  String? Function(String?)? emailValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  };

  String? Function(String?)? passwordValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  };

  String? Function(String?)? otpValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter OTP';
    }
    if (value.length != 6) {
      return 'OTP must be 6 digits';
    }
    return null;
  };

  String? Function(String?)? nameValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  };
}

AppValidations appValidations = AppValidations();
