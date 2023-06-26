bool isEmailValid(String? value) =>
    value != null &&
    value.isNotEmpty &&
    RegExp(
      r"^([!#$%&'*+/=?^`{}|~a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]{2,})$",
      caseSensitive: false,
    ).hasMatch(value);

bool isEmailEmpty(String? value) => value?.isEmpty ?? true;
