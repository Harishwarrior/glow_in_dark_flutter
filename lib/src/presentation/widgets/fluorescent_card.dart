import 'package:flutter/material.dart';

class FluorescentCard extends StatelessWidget {
  const FluorescentCard({
    super.key,
    required this.value,
    required this.animationDuration,
    required this.color,
  });

  final int value;
  final Duration animationDuration;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(24.0),
      alignment: Alignment.topLeft,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            spreadRadius: (40 - (value.roundToDouble() / 5)).clamp(0, 500),
            blurRadius: (40 - (value.roundToDouble() / 5)).clamp(0, 500),
            color: Colors.white,
          ),
        ],
      ),
      duration: animationDuration,
      child: AnimatedDefaultTextStyle(
        duration: animationDuration,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
          shadows: <Shadow>[
            Shadow(
              blurRadius: (30 - (value / 7)).clamp(0, 20),
              color: Colors.white,
            ),
          ],
        ),
        child: const Text(
          'Fluorescent',
        ),
      ),
    );
  }
}
