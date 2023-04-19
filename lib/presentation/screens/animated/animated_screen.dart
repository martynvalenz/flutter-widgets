import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape(){
    final random = Random();
    setState(() {
      width = random.nextInt(300).toDouble() + 120;
      height = random.nextInt(300).toDouble() + 120;
      color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1
      );
      borderRadius = random.nextInt(100).toDouble() + 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$width, $height, $borderRadius, $color'),
            const SizedBox(height: 20),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              width: width <= 0 ? 0 : width,
              height: height <= 0 ? 0 : height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: color,
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: const Icon(Icons.play_arrow),
        onPressed: () => changeShape(),
      )
    );
  }
}