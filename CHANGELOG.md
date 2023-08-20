## 1.4.0

* Added support for enabling or disabling tap gestures using [enableGestures] boolean variable (Addressing issue [#2](https://github.com/JohnF17/heart_overlay/issues/2))
* Added a [HeartOverlayController] that does not need to be disposed which is simply used to control and get information about the [HeartOverlay].
  * [showIcon(offset:...)]- Ability to show the icon at a desired location provided an offset (Addressing issue [#2](https://github.com/JohnF17/heart_overlay/issues/2))
  * [getCenterScreenOffset(context)] - method to get the center of the screen offset provided the build context
  * [getSize] - Get the size of the icon
  * [getHeight] - Get the height of the [HeartOverlay]
  * [getWidth] - Get the width of the [HeartOverlay]
  * [setGesture(enabled:...)] - enable or disable tap gesture
* Fixed a small bug where [BubblesColor] was not visible on import
* Few refactorings

[#Next]

* Introduce [PauseDuration] parameter - The amount of time the icon stays on the screen before the animation starts which'll default to 0 seconds.
* Add a new Tap Down Type called [TapDownType.doubleThenSingle] which triggers by a double tap then goes to single tap if the tap succession is within a certain amount of time like most social media apps.
* Support for icons to be vertically spaced out when created at about the same position.
* Add more methods to the [HeartOverlayController]
* Add a [SplashType] or [SplashShape] to the [SplashAnimationDetails]  by creating more painters (painter contributions are very welcome 👀)
* Introduce [DisplayType] parameter - A variable that determines preconfigured display types and also can be built via a [DisplayTypeBuilder]. The display type will default to the single icon appearing at the tap position. Although the icons will continue to shrink, move and fade, the [DisplayType] will help customize the amount of icons being displayed and the way they are displayed on screen. Here are some of the display types 
  * [RingDisplayType(...)] - Show `x` amount of icons with `x` radius while the animated icons display on the circumference 
  * [HeartDisplayType(...)] - Provide size `x` for the heart shape and display the animated icons all around the edges

## 1.3.0

* Added support for a light weight splash effect on widgets if the [SplashAnimationDetails] is provided.
  * [SplashAnimationDetails]'s [enableSplash] property is `false` by default.
  * Only works if the icon is of type [Icon]
  * Credits to `Like_button` widget on pub.dev for the painter.
* Fixed a bug introduced from `version: 1.2.0`. (_an uninitialized size variable_).

## 1.2.0

* Deprecated the [BackgroundWidget] to use [child] instead.
* Support for displaying any kind of widget instead of just `icon`s. 
* Mirrored the horizontal positioning of the [horizontalOffset] so that negative numbers offset the position to the left and positive offsets position to the right.
* [Size] is now relative:
  * Defaults to 80 when [icon] is any kind of widget including [Icon].
  * Defaults to 50 when [icon] is of type [Text], size in this case is [TextStyle.fontSize].
* Upgraded the sdk version and documentation.


## 1.1.0

* Added a tap down type selector which can be either [TapDownType.single] or [TapDownType.double].
It is set to [TapDownType.single] by default, but will change to [TapDownType.double] on the next update.
* Decreased the default cache extent from 35 to 20.
* Updated documentation.

## 1.0.1

* Added a callback funtion that gets triggered whenever an icon is displayed on screen along with a parameter that gives the number of hearts that have been formed before exceeding the cache extent.

## 1.0.0+1

* Few refactorings

## 1.0.0

* Initial release
