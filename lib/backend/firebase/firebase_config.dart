import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCPkEVlzDTlKkliD25S6GUBv0GXoDjjx58",
            authDomain: "airqual-9022b.firebaseapp.com",
            projectId: "airqual-9022b",
            storageBucket: "airqual-9022b.appspot.com",
            messagingSenderId: "665196806920",
            appId: "1:665196806920:web:a1f15cf63a3d21585d22bd",
            measurementId: "G-1BB4FSGHB6"));
  } else {
    await Firebase.initializeApp();
  }
}
