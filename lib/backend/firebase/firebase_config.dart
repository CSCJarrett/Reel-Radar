import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDl9xoEUeU8AxGMA1ZIJ0Di-8H01GBIxMA",
            authDomain: "reel-radar-d3c56.firebaseapp.com",
            projectId: "reel-radar-d3c56",
            storageBucket: "reel-radar-d3c56.firebasestorage.app",
            messagingSenderId: "782197339925",
            appId: "1:782197339925:web:11dfa6b5238eb4dbabdb1c",
            measurementId: "G-FBVTEDKG0L"));
  } else {
    await Firebase.initializeApp();
  }
}
