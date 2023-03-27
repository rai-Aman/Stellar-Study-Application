// ignore: file_names
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyStellarHome extends StatefulWidget {
  const MyStellarHome({Key? key}) : super(key: key);

  @override
  State<MyStellarHome> createState() => _MyStellarHomeState();
}

class _MyStellarHomeState extends State<MyStellarHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCFCFC),
        elevation: 0,
        centerTitle: false,
        title: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText(
              'Hello User!',
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB4B7BF),
              ),
              // speed: const Duration(milliseconds: 120),
            ),
          ],
          isRepeatingAnimation: true,
        ),
      ),
    );
  }
}
