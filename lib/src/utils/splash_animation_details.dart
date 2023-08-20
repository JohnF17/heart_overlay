import 'dart:ui';

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

class BubblesColor {
  const BubblesColor({
    required this.dotPrimaryColor,
    required this.dotSecondaryColor,
    this.dotThirdColor,
    this.dotLastColor,
  });
  final Color dotPrimaryColor;
  final Color dotSecondaryColor;
  final Color? dotThirdColor;
  final Color? dotLastColor;
  Color get dotThirdColorReal => dotThirdColor ?? dotPrimaryColor;

  Color get dotLastColorReal => dotLastColor ?? dotSecondaryColor;
}
