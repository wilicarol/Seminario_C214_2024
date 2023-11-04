import 'package:cicd/services/calculator_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Teste de soma', () {
    expect(CalculatorService.sum(5.0, 3.0), equals(8.0));
  });

  test('Teste de subtração', () {
    expect(CalculatorService.sub(5.0, 3.0), equals(2.0));
  });

  test('Teste de multiplicação', () {
    expect(CalculatorService.multi(5.0, 3.0), equals(15.0));
  });

  test('Teste de divisão', () {
    expect(CalculatorService.div(6.0, 2.0), equals(3.0));
  });

  test('Teste de raiz quadrada', () {
    expect(CalculatorService.raiz(16.0), equals(4.0));
  });

  test('Teste de potenciação', () {
    expect(CalculatorService.elevate(2.0, 3.0), equals(8.0));
  });

  test('Teste de porcentagem', () {
    expect(CalculatorService.percent(20.0, 100.0), equals(20.0));
  });
}
