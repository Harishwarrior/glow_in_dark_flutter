import 'package:flutter/material.dart';
import 'package:glow_in_dark_flutter/src/home/home_page.dart';

class GlowInDarkApp extends StatelessWidget {
  const GlowInDarkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glow in dark Flutter',
      home: HomePage(),
    );
  }
}
