## 1.0.0

* Initial release

## 1.0.0+1

* Few refactorings

## 1.0.1

* Added a callback funtion that gets triggered whenever an icon is displayed on screen along with a parameter that gives the number of hearts that have been formed before exceeding the cache extent.

## 1.1.0

* Added a tap down type selector which can be either [TapDownType.single] or [TapDownType.double].
It is set to [TapDownType.single] by default, but will change to [TapDownType.double] on the next update.
* Decreased the default cache extent from 35 to 20.
* Updating documentation

[#Next]

* Deprecate the BackgroundWidget and use child instead
* Introduce PauseDuration parameter - The amount of time the icon stays on the screen before the animation starts which'll defaults to 0 seconds.
* Add a new Tap Down Type called [TapDownType.doubleThenSingle] which triggers by a double tap then goes to single tap if the tap succession is within a certain amount of time.
* Support for displaying any kind of widget instead of just `icon`s (Although this would require the widget's size).
* Support for light weight animated Icons that have splashes.
* Support for icons to be vertically spaced out when created at about the same position.