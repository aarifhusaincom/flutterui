import 'package:flutter/material.dart';
import 'package:flutterui/example/aaspas_ui_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AaspasUIWidgets(),
      // home: AaspasUIWidgets(),
      // home: AaspasUIWidgets(),
      // home: AaspasUIWidgets(),
    );
  }
}
