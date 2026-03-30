import 'package:flutter_test/flutter_test.dart';
import 'package:subscription_manager/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SubscriptionManagerApp());
    expect(find.byType(SubscriptionManagerApp), findsOneWidget);
  });
}
