<!--
    Name: John
    GitHub: https://github.com/JohnF17
-->
## Heart Overlay Widget 💖

The `HeartOverlay` widget can be used to create a fun and interactive overlay that displays a heart animation when the user taps on the screen. It can be used as a decorative element for apps that require a playful or romantic touch, such as dating apps, greeting card apps, or social media apps.

![screenshot of the app](example/screenshots/heartoverlay.jpg)

_A screen record will be provided soon_

## Features 🤩

- Displays a heart-shaped icon overlaid on top of eachother when tapped in quick succession while shrinking and fading at the same time just like social media apps.💖
- The displayed icon can be styled however you like.🤗
- The overlay background can be customized however you like.✏️

## Getting started 🤗

To use this package, add `heart_overlay` as a dependency in your <u>pubspec.yaml</u> file.

Then import
```
    import 'package:heart_overlay/heart_overlay.dart';
``` 

## Usage 🧐

Simple usage: 
```dart
    HeartOverlay();
```

More customizability:
```dart
    HeartOverlay(
        icon: Icon(
          Icons.abc,
          color: Colors.cyan,
        ),
        verticalOffset: 50,  // Vertical Offset from tap position
        horizontalOffset: 50,  // Horizontal Offset from tap position
        duration: Duration(milliseconds: 800), // Icon to stay on screen duration 
        backgroundWidget: Image.asset('assets/image.png'), // Overlay container background
    ),
```

## Planning to add ➕

- [ ] Support for displaying any kind of widget instead of just `icon`s.
- [ ] Support for light weight animated Icons that have splashes (might require a dependency).
- [ ] Support for icons to be vertically spaced out when created at about the same position.
  - Probably a variable called `verticalSpaceBetweenIcons`.

## Common Errors 🐛

 If you get errors like `forces infinite height`/`forces infinite width`
 when used in a `Column`, `Row` or `Flex` widget, specify a desired `height`/`width` 
 
 OR 
 
 Wrap the `HeartOverlay` in an `Expanded`/`Flexible` widget.
 And if an `Expanded` widget is used, `height`/`width` properites are basically useless.


## Additional information ℹ️

This package is available on [GitHub](https://github.com/JohnF17/heart_overlay).📃

If you encounter any issues or would like to contribute to the package, feel free to open a [GitHub issue](https://github.com/JohnF17/heart_overlay/issues). Contributions are welcome and appreciated.🙏

A like👍 here and a star⭐ on gihub would be much appreciated. 🤗
