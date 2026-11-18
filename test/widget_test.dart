import 'package:flutter_test/flutter_test.dart';
import 'package:ludotec/app/app.dart';

void main() {
  testWidgets('LudoTec abre su bienvenida', (tester) async {
    await tester.pumpWidget(const LudoTecApp());
    expect(find.text('¡Bienvenido a LudoTec!'), findsOneWidget);
    expect(find.text('¡Comenzar!'), findsOneWidget);
  });
}
