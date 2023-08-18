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

class HeartOverlayTestWidget extends StatelessWidget {
  const HeartOverlayTestWidget({
    super.key,
  });

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
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.white10,
              tapDownType: TapDownType.single,
              verticalOffset: 20,
              horizontalOffset: -100,
              cacheExtent: 30,
              icon: const Icon(
                Icons.abc,
                color: Colors.purple,
                size: 100,
              ),
              onPressed: (numberOfHearts) {
                // Do something with the number of hearts or do something whenever the icon appears
              },
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Tap here'),
                ),
              ),
            ),
          ),
          Expanded(
            child: HeartOverlay(
              duration: const Duration(seconds: 10),
              backgroundColor: Colors.black,
              tapDownType: TapDownType.single,
              icon: const Text('✌️'),
              size: 60,
              // Sometimes it might be nesessary to add vertical and horizontal offset
              verticalOffset: 20,
              horizontalOffset: -10,
              onPressed: (numberOfHearts) {
                // Do something with the number of hearts or do something whenever the icon appears
              },
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Tap here'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
