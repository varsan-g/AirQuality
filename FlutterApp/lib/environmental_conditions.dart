import 'dart:math' as math;

class EnvironmentalConditions {
  double _temperature = 23.0;
  double _humidity = 35;
  int _co2 = 415;

  double get temperature => _temperature;
  double get humidity => _humidity;
  int get co2 => _co2;

  void update() {
    _temperature = 20.0 + math.Random().nextDouble() * 15;
    _humidity = 30 + math.Random().nextDouble() * 10;
    _co2 = 350 + math.Random().nextInt(100);
  }
}
