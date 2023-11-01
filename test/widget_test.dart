
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_old_am_i/screens/home_screen.dart';

void main() {
  testWidgets('MainScreen displays the form correctly', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: MainScreen()));

    final form = tester.widget<Form>(find.byType(Form));
    expect(form, isNotNull);

    final textFields = tester.widgetList<TextField>(find.byType(TextField));
    expect(textFields.length, 3);

    final textFieldTitles = textFields.map((textField) => textField.decoration?.hintText).toList();
    expect(textFieldTitles, ['Day', 'Month', 'Year']);
  });
}