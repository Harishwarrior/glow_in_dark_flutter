import 'dart:async';
import 'package:flutter/material.dart';
import 'package:glow_in_dark_flutter/src/presentation/widgets/fluorescent_card.dart';
import 'package:glow_in_dark_flutter/src/presentation/widgets/regular_card.dart';
import 'package:light_sensor/light_sensor.dart';

/// The main page of the Glow In Dark app.
/// This page uses the light sensor to control the brightness and color
/// of three cards in the app.
class GlowInDarkPage extends StatefulWidget {
  /// Creates a [GlowInDarkPage] widget.
  /// [key] is an optional parameter to provide a [Key] to this widget.
  const GlowInDarkPage({super.key});

  @override
  State<GlowInDarkPage> createState() => _GlowInDarkPageState();
}

class _GlowInDarkPageState extends State<GlowInDarkPage> {
  /// Stream subscription to listen to light sensor events
  late final StreamSubscription<int> listen;

  /// Value of the animation
  int animationValue = 0;

  /// Duration of the animation
  final Duration animationDuration = const Duration(seconds: 1);

  /// Color of the [RegularCard] and [FluorescentCard]
  final Color color = const Color(0xFF033ffe);

  /// Darkens the given [color].
  ///
  /// The [amount] parameter controls the degree of darkening.
  Color darken(Color color, [double amount = .1]) {
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((amount - hsl.lightness).clamp(0.3, 1.0));
    return hslDark.toColor();
  }

  @override
  void initState() {
    super.initState();
    // Initialize the light sensor stream
    listen = LightSensor.lightSensorStream.listen((lux) {
      setState(() {
        animationValue = lux;
      });
    });
  }

  @override
  void dispose() {
    // Cancel the light sensor stream
    listen.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedContainer(
        color: Colors.white.withOpacity(
          (animationValue / 200).clamp(0, 1),
        ),
        alignment: Alignment.center,
        duration: const Duration(seconds: 1),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).padding.top,
            horizontal: 16,
          ),
          child: Stack(
            children: [
              // Top RegularCard
              Align(
                alignment: Alignment.topCenter,
                child: RegularCard(
                  animationValue: animationValue,
                  animationDuration: animationDuration,
                  color: darken(color, (animationValue / 50).clamp(0.3, 1)),
                ),
              ),
              // Bottom RegularCard
              Align(
                alignment: Alignment.bottomCenter,
                child: RegularCard(
                  animationValue: animationValue,
                  animationDuration: animationDuration,
                  color: darken(color, (animationValue / 50).clamp(0.3, 1)),
                ),
              ),
              // FluorescentCard
              Align(
                child: FluorescentCard(
                  animationValue: animationValue,
                  animationDuration: animationDuration,
                  color: darken(color, (animationValue / 50).clamp(0.3, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
