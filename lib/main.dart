import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            actionsIconTheme: IconThemeData(
              color: Colors
                  .black, // Set the color of the back button or leading widget
            ),
            iconTheme: IconThemeData(
              color: Colors
                  .black, // Set the color of the back button or leading widget
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          iconTheme: IconThemeData(color: Colors.black)),
      home: SplashScreen(),
    );
  }
}
