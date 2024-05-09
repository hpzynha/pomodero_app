import 'package:flutter_test/flutter_test.dart';

import 'package:pomodero_app/main.dart';

void main() {
  testWidgets('Splash Animation Test', (WidgetTester tester) async {
    // Build your app and trigger a frame.
    await tester.pumpWidget(const PomoderoApp());

    // Aguarda um período de tempo suficiente para a animação da splash screen ser concluída
    await tester.pump(const Duration(seconds: 3));

    // Verifica se um widget específico está presente após a animação
    expect(find.text('Pomodoro App'), findsOneWidget);
  });
}
