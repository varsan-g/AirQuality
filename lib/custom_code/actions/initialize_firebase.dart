// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;

Future<void> initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: _getFirebaseOptions(),
  );
}

FirebaseOptions _getFirebaseOptions() {
  if (kIsWeb) {
    return FirebaseOptions(
      apiKey: 'AIzaSyCPkEVlzDTlKkliD25S6GUBv0GXoDjjx58',
      appId: '1:665196806920:web:a1f15cf63a3d21585d22bd',
      messagingSenderId: '665196806920',
      projectId: 'airqual-9022b',
      authDomain: 'airqual-9022b.firebaseapp.com',
      storageBucket: 'airqual-9022b.appspot.com',
    );
  }
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return FirebaseOptions(
        apiKey: 'AIzaSyBxv7JMHiCwwi1PqZCv1oFv8GF4lqurvsU',
        appId: '1:665196806920:android:8fd728de89a5956f5d22bd',
        messagingSenderId: '665196806920',
        projectId: 'airqual-9022b',
        storageBucket: 'airqual-9022b.appspot.com',
      );
    case TargetPlatform.iOS:
      return FirebaseOptions(
        apiKey: 'AIzaSyDEHQTyDAKFRF7Sob1WOGKti_GpYLHzyQ8',
        appId: '1:665196806920:ios:297221c79b5f41e85d22bd',
        messagingSenderId: '665196806920',
        projectId: 'airqual-9022b',
        storageBucket: 'airqual-9022b.appspot.com',
        iosBundleId: 'com.airqual.dashboard',
      );
    default:
      throw UnsupportedError(
        'FirebaseOptions are not supported for this platform.',
      );
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
