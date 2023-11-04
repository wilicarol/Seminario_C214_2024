import 'dart:math';

class CalculatorService{

  static sum(double x, double y){
    return x + y;
  }
  static sub(double x, double y){
    return x - y;
  }
  static multi(double x, double y){
    return x * y;
  }
  static div(double x, double y){
    return x / y;
  }
  static raiz(double x){
    return sqrt(x);
  }
  static elevate(double x, double y){
    return pow(x, y);
  }
  static percent(double x, double y){
    return (x / y) * 100;
  }
}