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
          children: const [
            Expanded(
              child: HeartOverlay(
                duration: Duration(seconds: 2),
                backgroundColor: Colors.lightBlue,
                height: 200,
                icon: Icon(
                  Icons.abc,
                  color: Colors.purple,
                  size: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
