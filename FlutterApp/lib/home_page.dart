import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'environmental_conditions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Timer? _timer;
  late EnvironmentalConditions _envConditions;

  @override
  void initState() {
    super.initState();
    _envConditions = EnvironmentalConditions();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _envConditions.update();
      });
    });
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
            Text('Temperatur: ${_envConditions.temperature.toStringAsFixed(1)}°C', style: textStyle),
            Text('Luftfugtighed: ${_envConditions.humidity.toStringAsFixed(1)}% RH', style: textStyle),
            Text('CO2: ${_envConditions.co2} ppm', style: textStyle),
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
