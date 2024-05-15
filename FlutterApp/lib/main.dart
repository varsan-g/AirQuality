import 'dart:async';
import 'dart:io' show Platform;
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Air Quality Monitor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Air Quality Monitor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Timer? _timer;
  double _temperature = 23.0;
  double _humidity = 35;
  int _co2 = 415;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _updateEnvironmentalConditions();
      });
    });
  }

  void _updateEnvironmentalConditions() {
    _temperature = 20.0 + math.Random().nextDouble() * 15;
    _humidity = 30 + math.Random().nextDouble() *10;
    _co2 = 350 + math.Random().nextInt(100);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineSmall;
    String platform = kIsWeb ? "Web" : Platform.operatingSystem;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Luftkvalitetssensor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Platform: $platform', style: textStyle),
            const SizedBox(height: 20),
            Text('Temperatur: ${_temperature.toStringAsFixed(1)}°C', style: textStyle),
            Text('Luftfugtighed: ${_humidity.toStringAsFixed(1)}% RH', style: textStyle),
            Text('CO2: $_co2 ppm', style: textStyle),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
