// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future extractData(
  List<String>? roomNames,
  List<double>? lastTemperature,
  List<double>? lastHumidity,
  List<double>? lastCO2,
) async {
  // Extract the sensor data such as roomNames, lastTemperature, lastHumidity and lastCO2.
  Map<String, dynamic> sensorData = {};

  if (roomNames != null &&
      lastTemperature != null &&
      lastHumidity != null &&
      lastCO2 != null) {
    for (int i = 0; i < roomNames.length; i++) {
      sensorData[roomNames[i]] = {
        "lastTemperature": lastTemperature[i],
        "lastHumidity": lastHumidity[i],
        "lastCO2": lastCO2[i],
      };
    }
  }
  print(sensorData);
  print("Hello World");

  return sensorData;
}
