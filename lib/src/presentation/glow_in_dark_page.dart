import 'dart:async';
import 'package:flutter/material.dart';
import 'package:glow_in_dark_flutter/src/presentation/widgets/fluorescent_card.dart';
import 'package:glow_in_dark_flutter/src/presentation/widgets/regular_card.dart';
import 'package:light_sensor/light_sensor.dart';

class GlowInDarkPage extends StatefulWidget {
  const GlowInDarkPage({super.key});

  @override
  State<GlowInDarkPage> createState() => _GlowInDarkPageState();
}

class _GlowInDarkPageState extends State<GlowInDarkPage> {
  late final StreamSubscription<int> listen;
  int value = 0;
  final Duration animationDuration = const Duration(seconds: 1);
  final Color color = const Color(0xFF033ffe);

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((amount - hsl.lightness).clamp(0.3, 1.0));

    return hslDark.toColor();
  }

  @override
  void initState() {
    super.initState();
    listen = LightSensor.lightSensorStream.listen((lux) {
      setState(() {
        value = lux;
      });
    });
  }

  @override
  void dispose() {
    listen.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedContainer(
        color: Colors.white.withOpacity(
          (value / 200).clamp(0, 1),
        ),
        alignment: Alignment.center,
        duration: const Duration(seconds: 1),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).padding.top,
            horizontal: 16.0,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: RegularCard(
                  value: value,
                  animationDuration: animationDuration,
                  color: darken(color, ((value / 50)).clamp(0.3, 1)),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RegularCard(
                  value: value,
                  animationDuration: animationDuration,
                  color: darken(color, ((value / 50)).clamp(0.3, 1)),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: FluorescentCard(
                  value: value,
                  animationDuration: animationDuration,
                  color: darken(color, ((value / 50)).clamp(0.3, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
