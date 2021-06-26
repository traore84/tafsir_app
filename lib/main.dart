import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tafsir_app/screens/home_screen.dart';
import 'package:tafsir_app/styles/theme_style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'application de lecture audio',
      theme: customTheme,
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(snapshot.error.toString()),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return HomeScreen();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
