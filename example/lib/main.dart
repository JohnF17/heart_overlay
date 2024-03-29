import 'dart:math';
import 'package:flutter/material.dart';
import 'package:heart_overlay/heart_overlay.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const HeartOverlayTestWidget(),
    );
  }
}

class HeartOverlayTestWidget extends StatefulWidget {
  const HeartOverlayTestWidget({
    super.key,
  });

  @override
  State<HeartOverlayTestWidget> createState() => _HeartOverlayTestWidgetState();
}

class _HeartOverlayTestWidgetState extends State<HeartOverlayTestWidget> {
  late HeartOverlayController heartOverlayController;

  @override
  void initState() {
    super.initState();
    heartOverlayController = HeartOverlayController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: const Text('Heart Overlay'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Expanded(
            child: HeartOverlay(
              controller: heartOverlayController,
              duration: const Duration(seconds: 5),
              backgroundColor: Colors.black,
              tapDownType: TapDownType.single,
              // verticalOffset: 20,
              // horizontalOffset: -100,
              enableGestures: true,
              cacheExtent: 30,
              splashAnimationDetails: const SplashAnimationDetails(
                enableSplash: true,
                animationDuration: Duration(seconds: 3),
              ),
              icon: const Icon(
                Icons.favorite,
                color: Colors.redAccent,
                size: 100,
              ),
              onPressed: (numberOfHearts) {
                // Do something with the number of hearts or do something whenever the icon appears
              },
              child: Center(
                child: ElevatedButton(
                  child: const Text('h'),
                  onPressed: () {
                    debugPrint(
                      ''' The following condition applies to all children that receive tap events within the HeartOverlay's `child`
If enablegestures is true 
- Tap events in the child only work if the `tapdowntype` is double else they might not
- And when tapdowntype is set to double and the child's callback works well, 
it might feel a bit delayed or slow but that's not performance issue at all but 
rather flutter's gesturedetector widget having a 300ms delay waiting on the double 
tapdown before letting other callbacks work, you can 
visit the issue https://github.com/flutter/flutter/issues/106170

If enableGestures is false 
- Tap events within the child will work as normal''',
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: ElevatedButton(
              onPressed: () {
                // Get the center offset
                // Offset centerOffset =
                //     heartOverlayController.getCenterScreenOffset(context);

                double iconSize = heartOverlayController.getSize() * 2;
                double height = heartOverlayController.getHeight() ??
                    MediaQuery.of(context).size.height;
                double width = heartOverlayController.getWidth() ??
                    MediaQuery.of(context).size.width;

                Offset offset = Offset(
                  // DX
                  (Random().nextDouble() * width).clamp(
                    iconSize,
                    width - iconSize,
                  ),
                  // DY
                  (Random().nextDouble() * height).clamp(
                    iconSize,
                    height - iconSize - 100,
                  ), // - 100 is for the button padding
                );

                // offset += centerOffset; // You can add offsets

                // Show the icon at the provided offset
                heartOverlayController.showIcon(
                  offset: offset,
                );

                // Changes to the emoji on the second click
                heartOverlayController.changeIcon(
                  icon: const Text('👀'), // Required
                  size: 200, // Not required
                  horizontalOffset: 10, // Not required
                  verticalOffset: 30, // Not required
                );
              },
              child: const Text('Show Icon'),
            ),
          )
          // Expanded(
          //   child: HeartOverlay(
          //     duration: const Duration(seconds: 2),
          //     backgroundColor: Colors.white10,
          //     tapDownType: TapDownType.single,
          //     icon: const Text('✌️'),
          //     // Splash would not work because the [icon] provided is not of type [Icon]
          //     splashAnimationDetails: const SplashAnimationDetails(
          //       enableSplash: true,
          //     ),
          //     size: 60,
          //     // Sometimes it might be nesessary to add vertical and horizontal offset
          //     verticalOffset: 20,
          //     horizontalOffset: -10,
          //     onPressed: (numberOfHearts) {
          //       // Do something with the number of hearts or do something whenever the icon appears
          //     },
          //     child: Center(
          //       child: ElevatedButton(
          //         onPressed: () {},
          //         child: const Text('Tap here'),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
