import 'package:buildpaw/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BuildPaw app renders', (WidgetTester tester) async {
    await tester.pumpWidget(const BuildPawApp());
    expect(find.text('BuildPaw'), findsOneWidget);
  });
}
