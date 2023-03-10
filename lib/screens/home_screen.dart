import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:how_old_am_i/utils/days_list.dart';
import 'package:how_old_am_i/widgets/widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isAnsDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isAnsDone)
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Wrap(
                    spacing: 14,
                    runSpacing: 14,
                    children: userAns(),
                  ),
                ),
              Form(
                key: _formKey,
                child: Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: userForm(MediaQuery.of(context).size.width),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: validateAndSave,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xffFDE694),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Text(
                    'How old am i ?',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form != null && form.validate()) {
      final DateTime dob = DateTime(
        int.parse(allQuestionAndAns[2].textEditingController.text),
        int.parse(allQuestionAndAns[1].textEditingController.text),
        int.parse(allQuestionAndAns[0].textEditingController.text),
      );

      final DateDuration diffWithToday = AgeCalculator.age(dob);

      allQuestionAndAns[0].ans = diffWithToday.days;
      allQuestionAndAns[1].ans = diffWithToday.months;
      allQuestionAndAns[2].ans = diffWithToday.years;

      setState(() {
        isAnsDone = true;
      });
    }
  }
}
