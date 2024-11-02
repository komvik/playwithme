import 'package:flutter/material.dart';

class ValidationUtils {
  static void validateLogin(String? text, ValueSetter<String?> setError) {
    if (text == null) {
      setError("Bitte Text eingeben");
    } else if (text.length < 6 && text.isNotEmpty) {
      setError("Korrigieren Sie Ihr Login");
    } else if (text.isEmpty) {
      setError("Bitte Text eingeben");
    } else {
      setError(null);
    }
  }

  static void onChangedLogin(String? text, ValueSetter<String?> setError) {
    setError(null);
  }

  static void validatePassword(String? text, ValueSetter<String?> setError) {
    if (text == null) {
      setError("Bitte Text eingeben");
    } else if (text.length < 6 && text.isNotEmpty) {
      setError("Korrigieren Sie Ihr Password");
    } else if (text.isEmpty) {
      setError("Bitte Text eingeben");
    } else {
      setError(null);
    }
  }

  static void onChangedPassword(String? text, ValueSetter<String?> setError) {
    setError(null);
  }
}
