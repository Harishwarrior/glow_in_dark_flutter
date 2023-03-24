import 'package:flutter/material.dart';

/// A widget that displays a card with text at the top left corner. The text and
/// the background color of the card can be animated using [animationValue].
class RegularCard extends StatelessWidget {
  /// Creates a [RegularCard] with the required [animationValue],
  /// [animationDuration], and [color]. An optional [key] can also be provided.
  const RegularCard({
    required this.animationValue,
    required this.animationDuration,
    required this.color,
    super.key,
  });

  /// The value that will be used for the animation.
  final int animationValue;

  /// The duration of the animation.
  final Duration animationDuration;

  /// The color of the [RegularCard].
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      height: MediaQuery.of(context).size.height * 0.28,
      padding: const EdgeInsets.all(24),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: AnimatedDefaultTextStyle(
        duration: animationDuration,
        style: TextStyle(
          // Configures a color for the text that depends on the
          // animation value.
          color: Colors.white.withOpacity(
            (animationValue / 100).clamp(0.3, 0.9),
          ),
          fontSize: 25,
        ),
        child: const Text(
          'Regular',
        ),
      ),
    );
  }
}
