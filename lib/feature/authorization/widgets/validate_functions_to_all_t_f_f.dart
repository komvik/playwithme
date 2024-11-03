import 'package:flutter/material.dart';

//=========== LOGIN

class ValidationUtils {
  static void validateLogin(String? text, ValueSetter<String?> setError) {
    if (text == null) {
      setError("Bitte Login eingeben");
    } else if (text.length < 6 && text.isNotEmpty) {
      setError("Korrigieren Sie Ihr Login");
    } else if (text.isEmpty) {
      setError("Bitte Login eingeben");
    } else {
      setError(null);
    }
  }

  static void onChangedLogin(String? text, ValueSetter<String?> setError) {
    setError(null);
  }
//===========  PASS

  static void validatePassword(String? text, ValueSetter<String?> setError) {
    if (text == null) {
      setError("Bitte Password eingeben");
    } else if (text.length < 6 && text.isNotEmpty) {
      setError("Korrigieren Sie Ihr Password");
    } else if (text.isEmpty) {
      setError("Bitte Password eingeben");
    } else {
      setError(null);
    }
  }

  static void onChangedPassword(String? text, ValueSetter<String?> setError) {
    setError(null);
  }

//===========  PASS CONFIRM

  static void validatePasswordC(String? text, ValueSetter<String?> setError) {
    if (text == null) {
      setError("Bitte Confirm Password eingeben");
    } else if (text.length < 6 && text.isNotEmpty) {
      setError("Korrigieren Sie Ihr Confirm Password");
    } else if (text.isEmpty) {
      setError("Bitte Confirm Password eingeben");
    } else {
      setError(null);
    }
  }

  static void onChangedPasswordC(String? text, ValueSetter<String?> setError) {
    setError(null);
  }

//==========  E_MAIL

  static void validateEmail(String? text, ValueSetter<String?> setError) {
    if (text == null) {
      setError("Bitte E-mail eingeben");
    } else if (text.length < 6 && text.isNotEmpty) {
      setError("Korrigieren Sie Ihr E-mail");
    } else if (text.isEmpty) {
      setError("Bitte E-mail eingeben");
    } else {
      setError(null);
    }
  }

  static void onChangedEmail(String? text, ValueSetter<String?> setError) {
    setError(null);
  }
}
