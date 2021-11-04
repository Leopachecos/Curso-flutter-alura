import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/dashboard_inicial.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

// import 'package:firebase_core';
// import 'package:firebase_crashlytics';
// import 'package:firebase_core_platform_interface';
// import 'package:quiver';
// import 'package:firebase_crashlytics_platform_interface';
// import 'package:plugin_platform_interface';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FirebaseCrashlytics.instance.setUserIdentifier('Alura123');
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
          secondary: Colors.blueAccent,
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.deepOrangeAccent,
            textTheme: ButtonTextTheme.primary),
      ),
      home: Dashboard(),
    );
  }
}
