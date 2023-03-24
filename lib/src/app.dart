import 'package:flutter/material.dart';
import 'package:glow_in_dark_flutter/src/presentation/glow_in_dark_page.dart';

/// Starting widget of the Glow in dark Flutter app.
/// Builds the UI using [GlowInDarkPage] widget.
class MyApp extends StatelessWidget {
  /// Initializes [key].
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Returns a MaterialApp with the title 'Glow in dark Flutter' and
    // the home page as the GlowInDarkPage widget.
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glow in dark Flutter',
      home: GlowInDarkPage(),
    );
  }
}
