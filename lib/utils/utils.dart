class Validators {
  static String? required(String? input) {
    if (input != null && input.isEmpty) {
      return "Username can't be empty";
    }

    return null;
  }
}
