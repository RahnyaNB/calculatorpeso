import 'dart:math';

class Calculator {
  final height;
  final weight;

  double bmi = 0;

  Calculator(this.weight, this.height);

  String calculateBMI() {
    bmi = weight / pow(height / 100.0, 2.0);

    return bmi.toStringAsFixed(2);
  }

  String getBMICategory() {
    String category;

    if (bmi < 18.5) {
      category = "Underweight: Consulta a un profesional de la salud para determinar la causa de tu bajo peso y desarrollar un plan de alimentación adecuado.";
    } else if (bmi < 25) {
      category = "Normal weight: Mantén una dieta equilibrada y haz ejercicio regularmente para mantener tu peso saludable.";
    } else if (bmi < 30) {
      category = "Overweight: Reduce las porciones de comida y aumenta la actividad física para perder peso gradualmente.";
    } else {
      category = "Obese: Busca la ayuda de un profesional de la salud para crear un plan de pérdida de peso seguro y sostenible, que incluya cambios en la dieta y actividad física.";
    }

    return category;
  }
}
