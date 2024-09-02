import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAHf1wQ4iSLbWeiadjOWPFEiHODsGZcsTQ",
            authDomain: "cogeus-d3abb.firebaseapp.com",
            projectId: "cogeus-d3abb",
            storageBucket: "cogeus-d3abb.appspot.com",
            messagingSenderId: "302797249174",
            appId: "1:302797249174:web:f6c07b99f6acdac6f1c0b7",
            measurementId: "G-3D7Z8Z2DYF"));
  } else {
    await Firebase.initializeApp();
  }
}
