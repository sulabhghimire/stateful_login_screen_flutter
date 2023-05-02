class ValidationMixin {
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "The email field can't be empty";
    } else if (!value.contains('@')) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "The password can't be empty";
    } else if (value.length < 4) {
      return "Password must be at least 4 characters";
    }
    return null;
  }
}
