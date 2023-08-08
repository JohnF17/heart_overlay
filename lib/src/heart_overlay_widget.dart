import 'package:flutter/material.dart';

/// Tap Down Type which can be either [TapDownType.single] or [TapDownType.double]
enum TapDownType {
  /// Single tap to start the animation
  single,

  /// Double tap to start the animation
  double,
}

/// A Flutter widget that displays a heart overlay.
///
/// The `HeartOverlay` widget can be used to create a fun and interactive overlay that
/// displays a heart animation when the user taps on the screen. It can be used as a
/// decorative element for apps that require a playful or romantic touch, such as dating
/// apps, greeting card apps, or social media apps.
///
/// The `HeartOverlay` widget allows you to customize the size, position, color, and
/// animation duration of the heart, as well as the widget that serves as the background.
///
/// To use the `HeartOverlay` widget, simply place the widget anywhere you want to and
/// you're good to go. Additionally you can pass in any optional named parameters that you
/// want to customize.
///
/// Example:
/// ```dart
/// class MyHomePage extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: Column(
///         children: [
///           Expanded(
///             child: HeartOverlay(
///               icon: Icon(
///                 Icons.abc,
///                 color: Colors.cyan,
///                 size: 80,
///               ),
///               tapDownType: TapDownType.single,
///               verticalOffset: 50,
///               horizontalOffset: 50,
///               duration: Duration(milliseconds: 800),
///               decoration: BoxDecoration(
///                 borderRadius: BorderRadius.circular(50),
///                 gradient: LinearGradient(
///                   colors: [Colors.red, Colors.orange],
///                   begin: Alignment.topCenter,
///                  end: Alignment.bottomCenter,
///                ),
///               ),
///             ),
///           ),
///         ],
///       ),
///     );
///   }
/// }
/// ```
/// ## Common Errors
///
/// If you get errors like `forces infinite height`/`forces infinite width`
/// when used in a `Column`, `Row` or `Flex` widget, 
/// 
/// Specify a desired `height`/`width`
///
/// OR
///
/// Wrap the `HeartOverlay` in an `Expanded`/`Flexible` widget.
/// And if an `Expanded` widget is used, `height`/`width` properites are basically useless.
///
class HeartOverlay extends StatefulWidget {
  const HeartOverlay({
    super.key,
    this.verticalOffset,
    this.horizontalOffset,
    this.size,
    this.icon,
    this.duration,
    this.backgroundColor,
    this.decoration,
    this.backgroundWidget,
    this.width,
    this.height,
    this.cacheExtent,
    this.onPressed,
    this.tapDownType,
  });

  /// Icon widget that is displayed instead of the heart icon.
  ///
  /// Defaults to
  /// ```
  ///   Icon(
  ///     Icons.favorite,
  ///     color: Colors.red,
  ///     size: size,
  ///   )
  /// ```
  final Icon? icon;

  /// Width of the overlay board.
  ///
  /// Defaults to [double.infinity]/Full width.
  ///
  /// If you get errors like `forces infinite width`
  /// when used in a `Row` or `Flex` widget, specify a desired width or wrap the `HeartOverlay` in an `Expanded`/`Flexible` widget.
  /// And if an `Expanded` widget is used, this field is basically useless.
  final double? width;

  /// Height of the overlay board.
  ///
  /// Defaults to [double.infinity]/Full height.
  ///
  /// If you get errors like `forces infinite height`
  /// when used in a `Column` or `Flex` widget, specify a desired height or wrap the `HeartOverlay` in an `Expanded`/`Flexible` widget.
  /// And if an `Expanded` widget is used, this field is basically useless.
  final double? height;

  /// A widget to be used as the background for the overlay.
  ///
  /// More like the child of the heart overlay.
  final Widget? backgroundWidget;

  /// Duration of the [icon] animation to stay on the screen.
  final Duration? duration;

  /// Horizontal offset of the heart/[icon] position.
  ///
  /// Defaults to half of the icon size - meaning the exact position the tap was registered.
  ///
  /// If horizontal offset is positive, the [icon] goes to the left.
  ///
  /// If horizontal offset is negative, the [icon] goes to the right.
  final double? horizontalOffset;

  /// Vertical offset of the heart/[icon] position.
  ///
  /// Defaults to half of the icon size - meaning the exact position the tap was registered.
  ///
  /// If vertical offset is positive, the [icon] goes up.
  ///
  /// If vertical offset is negative, the [icon] goes down.
  final double? verticalOffset;

  /// Size of the heart but `can be overridden` by size given to the [icon].
  /// So it should not be provided!
  ///
  /// Defaults to 80.
  final double? size;

  /// Background color of the overlay widget.
  ///
  /// `Can be overriden` by [backgroundWidget] if its not transparent or null.
  final Color? backgroundColor;

  /// Decoration property of the overlay widget.
  ///
  /// `Can be overriden` by [backgroundWidget] if its not transparent or null.
  /// `Can be overriden` by [backgroundColor] if its not transparent or null.
  final BoxDecoration? decoration;

  /// The amount of icons that can be stored before reset.
  ///
  /// Defaults to 20.
  ///
  /// Even though this is a `very lightweight package`, the lower the cache extent is,
  /// the better the performance for lower to mid tier devices.
  final int? cacheExtent;

  /// An optional callback that triggers when an icon appears on screen.
  ///
  /// Also gives a parameter that holds the number of hearts that have been
  /// displayed on screen before exceeding the [cacheExtent].
  final Function(int? numberOfHearts)? onPressed;

  /// An optional parameter that sets the animation trigger type.
  ///
  /// It can be either [TapDownType.single] or [TapDownType.double].
  ///
  /// Defaults to [TapDownType.single]
  final TapDownType? tapDownType;

  @override
  State<HeartOverlay> createState() => _HeartOverlayState();
}

/// State of the HeartOverlay widget
class _HeartOverlayState extends State<HeartOverlay> {
  // Local variables
  late double horizontalOffset;
  late double verticalOffset;
  late BoxDecoration decoration;
  late double size;
  late int cacheExtent;
  late TapDownType tapDownType;

  List<Widget> _hearts = [];

  @override
  void initState() {
    super.initState();
    assert(
      () {
        if (widget.icon != null && widget.size != null) {
          throw 'If icon is not null, size should not be provided through this parameter instead size has to be provided within the icon widget itself!';
        }
        return true;
      }(),
    );

    // Set the size, vertical offset, and horizontal offset of the heart/child based on the passed-in values or defaults
    size = widget.icon?.size ?? widget.size ?? 80;
    verticalOffset = (size / 2) + (widget.verticalOffset ?? 0);
    horizontalOffset = (size / 2) + (widget.horizontalOffset ?? 0);

    // Determine the decoration of the heart based on the passed-in values or defaults
    Color color = widget.decoration?.color ??
        widget.backgroundColor ??
        Colors.transparent;

    decoration = widget.decoration?.copyWith(color: color) ??
        BoxDecoration(color: color);

    // Set the cache extent
    cacheExtent = widget.cacheExtent ?? 20;

    // Set the tap down type
    tapDownType = widget.tapDownType ?? TapDownType.single;
  }

  /// Define a method to add new hearts to the screen when the user taps on it
  void _addHearts(TapDownDetails details) {
    // If there are already 35 hearts in memory, clear them out to avoid performance issues
    if (_hearts.length >= cacheExtent) {
      _hearts = [];
    }
    // Add a new heart to the list of hearts on the screen
    setState(() {
      _hearts = List.from(_hearts)
        ..add(
          Positioned(
            left: details.localPosition.dx - horizontalOffset,
            top: details.localPosition.dy - verticalOffset,
            child: _buildHeart(),
          ),
        );
      widget.onPressed?.call(_hearts.length);
    });
  }

  /// Define a method to build a heart using an animation
  Widget _buildHeart() {
    return TweenAnimationBuilder<double>(
      // The Tween defines the range of the animation. Here, it goes from 1 to 0, which means the animation will
      // start with the size of the heart being 100% and end with 0%, meaning the heart will disappear.
      tween: Tween(begin: 1, end: 0),
      duration: widget.duration ?? const Duration(seconds: 1),
      // The child widget to animate. If none is provided, an Icon with the favorite icon and a red color will be used.
      child: widget.icon ??
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: size,
          ),
      builder: (BuildContext context, double value, Widget? child) {
        // The offset of the transformed widget. It moves the heart icon up as it becomes smaller.
        final offset = Offset(0, (100 * value) - (verticalOffset * 2));

        return Transform.translate(
          offset: offset,
          // The Opacity widget fades out the heart icon as it becomes smaller.
          child: Opacity(
            opacity: value,
            child: Transform.scale(
              scale: value,
              child: child,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: tapDownType == TapDownType.single ? _addHearts : null,
      onDoubleTapDown: tapDownType == TapDownType.double ? _addHearts : null,
      child: Container(
        decoration: decoration,
        width: widget.width ?? double.infinity,
        height: widget.height ?? double.infinity,
        child: Stack(
          children: [
            // Show the provided Background widget if null show nothing
            Positioned.fill(
              child: widget.backgroundWidget ?? const SizedBox.shrink(),
            ),
            Stack(
              children: _hearts,
            ),
          ],
        ),
      ),
    );
  }
}
