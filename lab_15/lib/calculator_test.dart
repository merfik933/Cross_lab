import 'package:flutter_test/flutter_test.dart';
import 'package:lab_15/calculator.dart';

void main() {
  group('Calculator Tests', () {
    final calculator = Calculator();

    test('Calculator should return correct result for x = 2', () {
      final result = calculator.calculate(2);
      expect(result, 5 / (4 * 2 * 2));
    });

    test('Calculator should return correct result for x = 0', () {
      final result = calculator.calculate(0);
      expect(result, 0);
    });

    test('Calculator should return correct result for negative x', () {
      final result = calculator.calculate(-2);
      expect(result, 5 / (4 * (-2) * (-2)));
    });
  });
}
