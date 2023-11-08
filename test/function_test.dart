import 'package:cicd/service/calculator_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Teste de soma', () {
    expect(CalculatorService.calc('5.0+3.0'), equals('8.0'));
  });

  test('Teste de subtração', () {
    expect(CalculatorService.calc('5.0-3.0'), equals('2.0'));
  });

  test('Teste de multiplicação', () {
    expect(CalculatorService.calc('5.0*3.0'), equals('15.0'));
  });

  test('Teste de divisão', () {
    expect(CalculatorService.calc('6.0/2.0'), equals('3.0'));
  });

  test('Teste de raiz quadrada', () {
    expect(CalculatorService.calc('16.0^(1/2)'), equals('4.0'));
  });

  test('Teste de potenciação', () {
    expect(CalculatorService.calc('3.0^2'), equals('9.0'));
  });

  test('Teste de porcentagem', () {
    expect(CalculatorService.calc('20.0'), equals('20.0'));
  });
}