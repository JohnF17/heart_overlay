import 'dart:ui';
import 'package:heart_overlay/src/utils/circle_color.dart';

class SplashAnimationDetails {
  final bool enableSplash;
  final Duration animationDuration;
  final BubblesColor bubblesColor;
  final double? circleSize;
  final double? bubblesSize;

  const SplashAnimationDetails({
    required this.enableSplash,
    this.animationDuration = const Duration(seconds: 1),
    this.circleSize,
    this.bubblesSize,
    this.bubblesColor = const BubblesColor(
      dotPrimaryColor: Color(0xFFFFC107),
      dotSecondaryColor: Color(0xFFFF9800),
      dotThirdColor: Color(0xFFFF5722),
      dotLastColor: Color(0xFFF44336),
    ),
  });
}
