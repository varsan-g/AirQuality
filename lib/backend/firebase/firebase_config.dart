import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAVJAa71zKElEBrbWDIhInsmik-Nl4aVws",
            authDomain: "nocodeui-db3f9.firebaseapp.com",
            projectId: "nocodeui-db3f9",
            storageBucket: "nocodeui-db3f9.appspot.com",
            messagingSenderId: "578639121291",
            appId: "1:578639121291:web:4f4b40683c9f4c3102fd8e",
            measurementId: "G-2FH2RCKBDV"));
  } else {
    await Firebase.initializeApp();
  }
}
