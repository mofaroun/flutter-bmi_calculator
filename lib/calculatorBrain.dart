import 'dart:math';

class Calculatorbrain {
  final int height;
  final int weight;
  double _bmi = 0;

  Calculatorbrain({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = (weight / pow(height, 2)) * 703;
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25.0) {
      return "You are overweight.";
    } else if (_bmi > 18.5) {
      return "Keep it up";
    } else {
      return "You are underweight.";
    }
  }
}
