import 'package:flutter/material.dart';

class DateModel {
  DateModel({
    required this.questionTitle,
    required this.answerTitle,
    required this.validation,
    required this.textEditingController,
    required this.maxLength,
  });

  set ans(int value) {
    _ans = value;
  }

  int get ans => _ans ?? 0;

  final String questionTitle;
  final String answerTitle;
  final String? Function(String?) validation;
  final TextEditingController textEditingController;
  final int maxLength;
  int? _ans;
}
