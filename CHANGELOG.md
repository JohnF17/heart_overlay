## 1.3.0

* Added support for a light weight splash effect on widgets if the provided[splashAnimationDetails].
  * [splashAnimationDetails]'s [enableSplash] property is `true` which by default is `false`.
  * Only works if the icon is of type [Icon]
  * Credits to `Like_button` widget on pub.dev for the painter.
* Fixed a bug introduced from `version: 1.2.0`. (_an uninitialized size variable_).

[#Next]

* Introduce [PauseDuration] parameter - The amount of time the icon stays on the screen before the animation starts which'll default to 0 seconds.
* Add a new Tap Down Type called [TapDownType.doubleThenSingle] which triggers by a double tap then goes to single tap if the tap succession is within a certain amount of time.
* Support for icons to be vertically spaced out when created at about the same position.

## 1.2.0

* Deprecated the [BackgroundWidget] to use [child] instead.
* Support for displaying any kind of widget instead of just `icon`s. 
* Mirrored the horizontal positioning of the [horizontalOffset] so that negative numbers offset the position to the left and positive offsets position to the right.
* [Size] is now relative:
  * Defaults to 80 when [icon] is any kind of widget including [Icon].
  * Defaults to 50 when [icon] is of type [Text], size in this case is [TextStyle].
* Upgraded the sdk version documentation.


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
