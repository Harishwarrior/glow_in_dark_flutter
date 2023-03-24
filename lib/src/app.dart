import 'package:flutter/material.dart';
import 'package:glow_in_dark_flutter/src/presentation/glow_in_dark_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glow in dark Flutter',
      home: GlowInDarkPage(),
    );
  }
}
