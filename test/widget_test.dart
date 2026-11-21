import 'package:flutter_test/flutter_test.dart';

import 'package:campus_hub/main.dart';

void main() {
  testWidgets('四个主导航标签可用', (WidgetTester tester) async {
    await tester.pumpWidget(const CampusHubApp());

    expect(find.text('课表'), findsWidgets);
    expect(find.text('作业'), findsWidgets);
    expect(find.text('日历'), findsWidgets);
    expect(find.text('待办'), findsWidgets);
  });
}
