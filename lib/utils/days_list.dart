import 'package:flutter/material.dart';
import 'package:how_old_am_i/utils/all_const.dart';
import 'package:how_old_am_i/utils/date_model.dart';

final List<DateModel> allQuestionAndAns = [
  DateModel(
    answerTitle: 'Days',
    maxLength: 2,
    questionTitle: 'Day',
    textEditingController: TextEditingController(),
    validation: dayValidation,
  ),
  DateModel(
    answerTitle: 'Months',
    maxLength: 2,
    questionTitle: 'Month',
    textEditingController: TextEditingController(),
    validation: monthValidation,
  ),
  DateModel(
    answerTitle: 'Years',
    maxLength: 4,
    questionTitle: 'Year',
    textEditingController: TextEditingController(),
    validation: yearValidation,
  ),
];
