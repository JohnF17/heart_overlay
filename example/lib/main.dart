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
      home: Scaffold(
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
                backgroundColor: Colors.lightBlue,
                tapDownType: TapDownType.double,
                verticalOffset: 10,
                horizontalOffset: 10,
                cacheExtent: 30,
                backgroundWidget: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Tap here'),
                  ),
                ),
                icon: const Icon(
                  Icons.abc,
                  color: Colors.purple,
                  size: 100,
                ),
                onPressed: (numberOfHearts) {
                  // Do something with the number of hearts or do something whenever the icon appears
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
