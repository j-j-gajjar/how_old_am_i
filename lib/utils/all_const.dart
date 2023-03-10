import 'package:flutter/material.dart';

OutlineInputBorder borderColorAndWIdth() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      width: 2,
      color: Color(0xFFC4B062),
    ),
  );
}

String? dayValidation(String? value) {
  final dayRegExp = RegExp(r'\b(0?[1-9]|[12][0-9]|3[01])\b');
  if (!dayRegExp.hasMatch(value ?? '')) {
    return '1 - 31';
  }
  return null;
}

String? monthValidation(String? value) {
  final dayRegExp = RegExp(r'\b(0?[1-9]|[1][0-2])\b');

  if (!dayRegExp.hasMatch(value ?? '')) {
    return '1 - 12';
  }
  return null;
}

String? yearValidation(String? value) {
  final dayRegExp = RegExp(r'^(19|20)\d{2}$');

  if (!dayRegExp.hasMatch(value ?? '')) {
    return '1900 - 2099';
  }
  return null;
}
