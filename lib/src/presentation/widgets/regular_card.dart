import 'package:flutter/material.dart';

class RegularCard extends StatelessWidget {
  const RegularCard({
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
      duration: animationDuration,
      height: MediaQuery.of(context).size.height * 0.3,
      padding: const EdgeInsets.all(24.0),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: color,
      ),
      child: AnimatedDefaultTextStyle(
        duration: animationDuration,
        style: TextStyle(
          color: Colors.white.withOpacity(
            (value / 100).clamp(0.3, 0.9),
          ),
          fontSize: 20.0,
        ),
        child: const Text(
          'Regular',
        ),
      ),
    );
  }
}
