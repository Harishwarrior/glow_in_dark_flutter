import 'package:flutter/material.dart';

/// A custom widget that displays a colored card with text at the top left.
/// The color, text, and shadow of the card can be animated using the provided
/// [color], [animationValue] and [animationDuration].
class FluorescentCard extends StatelessWidget {
  /// Creates a new [FluorescentCard] widget with the specified [animationValue]
  /// [animationDuration], and [color].
  ///
  /// The [animationValue] determines the state of the animation.
  /// The [animationDuration] determines the length of the
  /// animation. The [color] specifies the background color of the card.
  const FluorescentCard({
    required this.animationValue,
    required this.animationDuration,
    required this.color,
    super.key,
  });

  /// value that will be used for animation
  final int animationValue;

  /// The duration of the animation.
  final Duration animationDuration;

  /// The background color of the card.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(24),
      alignment: Alignment.topLeft,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
        // Configures a box shadow that depends on the animation value.
        boxShadow: [
          BoxShadow(
            spreadRadius:
                (40 - (animationValue.roundToDouble() / 5)).clamp(0, 500),
            blurRadius:
                (40 - (animationValue.roundToDouble() / 5)).clamp(0, 500),
            color: Colors.white,
          ),
        ],
      ),
      // Configures the duration of the container animation.
      duration: animationDuration,
      child: AnimatedDefaultTextStyle(
        duration: animationDuration,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          // Configures a shadow for the text that depends on the
          // animation value.
          shadows: <Shadow>[
            Shadow(
              blurRadius: (30 - (animationValue / 7)).clamp(0, 20),
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
