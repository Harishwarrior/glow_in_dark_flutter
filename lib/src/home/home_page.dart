import 'dart:async';
import 'package:flutter/material.dart';
import 'package:light_sensor/light_sensor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription<int> listen;
  int value = 0;

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
    super.dispose();
    listen.cancel();
  }

  @override
  Widget build(BuildContext context) {
    print;
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedContainer(
        color:
            Colors.white.withOpacity((value.roundToDouble() / 100).clamp(0, 1)),
        alignment: Alignment.center,
        duration: const Duration(seconds: 1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 30,
              ),
              PlaceHolderWidget(value: value),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF031D98),
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius:
                            40 - (value.roundToDouble() / 5).clamp(0, 500),
                        blurRadius:
                            40 - (value.roundToDouble() / 5).clamp(0, 500),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  duration: const Duration(seconds: 1),
                  child: AnimatedDefaultTextStyle(
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      shadows: <Shadow>[
                        Shadow(
                          blurRadius: 30 -
                              (value.roundToDouble() / 7)
                                  .clamp(1, 100)
                                  .abs()
                                  .toDouble(),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    duration: const Duration(seconds: 2),
                    child: const Text(
                      'Flourescent',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              PlaceHolderWidget(value: value),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceHolderWidget extends StatelessWidget {
  const PlaceHolderWidget({
    super.key,
    required this.value,
  });

  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: const Color(0xFF031D98)
              .withOpacity((value.roundToDouble() / 5).clamp(0.5, 0.9)),
        ),
      ),
    );
  }
}
