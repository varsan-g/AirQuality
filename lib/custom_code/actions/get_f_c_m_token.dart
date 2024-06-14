// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';

Future<String?> getFCMToken() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.getNotificationSettings();
  if (settings.authorizationStatus != AuthorizationStatus.authorized) {
    return null;
  }
  String? fcmToken = await FirebaseMessaging.instance.getToken();
  return fcmToken;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
