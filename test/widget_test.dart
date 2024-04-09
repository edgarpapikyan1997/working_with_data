// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:working_with_data_project/main.dart';
import 'package:working_with_data_project/pages/home_page.dart';
import 'package:working_with_data_project/storage_providers/storage_provider_path.dart';

void main() {
  // group("Storage, adding, deleting", () {
  //   test('Storage must be empty at start', () {
  //     final storageProvider = StorageDataProvider();
  //     expect(storageProvider.box, null);
  //   });
  // });
  test('Check Home Page', () {
    testWidgets('Testing the Home Page', (widgetTester) async {
      await widgetTester.pumpFrames(const HomePage(), Duration(seconds: 5));
    });
  });

}
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());
//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);
//
//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();
//
//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }
