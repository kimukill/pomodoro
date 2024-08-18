import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSecond = 1500;
  int minText = 25;
  int secText = 0;
  int pomodoro = 0;
  late Timer timer;
  bool running = false;

  void onTick(Timer timer) {
    setState(() {
      totalSecond = totalSecond - 1;
      minText = totalSecond ~/ 60;
      secText = totalSecond % 60;
    });
    if (totalSecond <= 0) {
      setState(() {
        totalSecond = 1500;
        minText = 25;
        secText = 0;
        pomodoro = pomodoro + 1;
        onPausePresse();
      });
    }
  }

  void onStartPress() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      running = true;
    });
  }

  void onPausePresse() {
    timer.cancel();
    setState(() {
      running = false;
    });
  }

  void reset() {
    totalSecond = 1500;
    minText = 25;
    secText = 0;
    onPausePresse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7626C),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: reset,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$minText : ',
                        style: const TextStyle(
                            color: Color(0xFFF4EDDB),
                            fontSize: 45,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '$secText',
                        style: const TextStyle(
                            color: Color(0xFFF4EDDB),
                            fontSize: 45,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                )),
          ),
          Flexible(
            flex: 2,
            child: Center(
                child: IconButton(
              onPressed: running ? onPausePresse : onStartPress,
              icon: Icon(
                running
                    ? Icons.pause_circle_outline_rounded
                    : Icons.play_circle_outline_rounded,
                color: Color(0xFFF4EDDB),
                size: 90,
              ),
            )),
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color(0xFFF4EDDB),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Pomodoros",
                          style: TextStyle(
                              color: Color(0xFF232B55),
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '$pomodoro',
                          style: const TextStyle(
                              color: Color(0xFF232B55),
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
