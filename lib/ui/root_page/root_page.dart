import 'package:flutter/material.dart';
import 'package:fortune_wheel_game/ui/home_page/home_page.dart';

class FortuneWheelApp extends StatelessWidget {
  const FortuneWheelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
