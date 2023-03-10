import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:how_old_am_i/utils/all_const.dart';
import 'package:how_old_am_i/utils/days_list.dart';

SizedBox textFieldHOIM({
  required double width,
  required String hintText,
  required TextEditingController controller,
  int maxLength = 2,
  String? Function(String?)? validator,
}) {
  return SizedBox(
    width: width / 4,
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      validator: validator,
      maxLength: maxLength,
      decoration: InputDecoration(
        border: borderColorAndWIdth(),
        focusedBorder: borderColorAndWIdth(),
        enabledBorder: borderColorAndWIdth(),
        hintText: hintText,
        counterText: '',
      ),
    ),
  );
}

Container displayAns({
  required String title,
  required String description,
}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xffFDE694),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    ),
  );
}

List<Widget> userForm(double width) {
  return allQuestionAndAns
      .map(
        (questionAndAns) => textFieldHOIM(
          width: width,
          hintText: questionAndAns.questionTitle,
          validator: questionAndAns.validation,
          controller: questionAndAns.textEditingController,
          maxLength: questionAndAns.maxLength,
        ),
      )
      .toList();
}

List<Widget> userAns() {
  return allQuestionAndAns.reversed
      .map(
        (questionAndAns) => displayAns(
          title: questionAndAns.ans.toString(),
          description: questionAndAns.answerTitle,
        ),
      )
      .toList();
}
