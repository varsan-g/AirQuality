import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

List<String>? newCustomFunction(List<String>? value) {
  // Take a list and return the last 50 values.
  if (value == null || value.isEmpty) {
    return null;
  }
  if (value.length <= 10) {
    return value;
  }
  return value.sublist(value.length - 10);
}

Color conditionalColorTemperature(String temperatureValue) {
  double intTemp = double.parse(temperatureValue);
  // If co2value is above 1000 return red,  above 800 return yellow, less than 800 return green.
  if (intTemp > 26 || intTemp < 16) {
    return Colors.red;
  } else if (intTemp > 23 || intTemp < 19) {
    return Colors.yellow;
  } else {
    return Colors.green;
  }
}

Color conditionalColorHumidity(String humidityValue) {
  double intTempH = double.parse(humidityValue);
  // If co2value is above 1000 return red,  above 800 return yellow, less than 800 return green.
  if (intTempH < 30 || intTempH > 50) {
    return Colors.red;
  } else if (intTempH < 35 || intTempH > 40) {
    return Colors.yellow;
  } else {
    return Colors.green;
  }
}

Color conditionalColorCO2(String co2value) {
  int intCO2 = int.parse(co2value);
  // If co2value is above 1000 return red,  above 800 return yellow, less than 800 return green.
  if (intCO2 > 1000 || intCO2 == 0) {
    return Colors.red;
  } else if (intCO2 > 800) {
    return Colors.yellow;
  } else {
    return Colors.green;
  }
}

double? convertStringToInt(String? value) {
  // Convert string to int
  if (value == null) {
    return null;
  }
  try {
    return double.parse(value);
  } catch (e) {
    return null;
  }
}

bool convertStringToBool(String value) {
  // take string and return bool
  return value.toLowerCase() == 'true';
}

String capitalizeLetter(String value) {
  // capitalize the first letter of each word
  List<String> words = value.split(' ');
  String capitalized = '';
  for (String word in words) {
    capitalized += word[0].toUpperCase() + word.substring(1) + ' ';
  }
  return capitalized.trim();
}
