import 'package:flutter/material.dart';
import 'package:heart_overlay/src/painter/bubbles_painter.dart';
import 'package:heart_overlay/src/utils/splash_animation_details.dart';

/// Splash widget is a widget that wraps your widget with a splash effect
class SplashWidget extends StatefulWidget {
  const SplashWidget({
    super.key,
    required this.child,
    required this.bubblesColor,
    required this.size,
    required this.animationDuration,
    this.circleSize,
    this.bubblesSize,
  });

  final Duration animationDuration;
  final BubblesColor bubblesColor;
  final double? circleSize;
  final double? bubblesSize;
  final double size;
  final Widget child;

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bubblesAnimation;
  late double circleSize, bubblesSize;

  @override
  void initState() {
    super.initState();
    circleSize = widget.circleSize ?? widget.size * 0.8;
    bubblesSize = widget.bubblesSize ?? widget.size * 2.0;

    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    )..forward();

    _initControlAnimation();
  }

  @override
  void didUpdateWidget(dynamic oldWidget) {
    if (_controller.duration != widget.animationDuration) {
      _controller.dispose();
      _controller =
          AnimationController(duration: widget.animationDuration, vsync: this);
      _initControlAnimation();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initControlAnimation() {
    _bubblesAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.1,
          1.0,
          curve: Curves.decelerate,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        return Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              top: (widget.size - bubblesSize) / 2.0,
              left: (widget.size - bubblesSize) / 2.0,
              child: CustomPaint(
                size: Size(bubblesSize, bubblesSize),
                painter: BubblesPainter(
                  currentProgress: _bubblesAnimation.value,
                  color1: widget.bubblesColor.dotPrimaryColor,
                  color2: widget.bubblesColor.dotSecondaryColor,
                  color3: widget.bubblesColor.dotThirdColorReal,
                  color4: widget.bubblesColor.dotLastColorReal,
                ),
              ),
            ),
            if (child != null)
              Container(
                alignment: Alignment.center,
                child: child,
              ),
          ],
        );
      },
    );
  }
}
