import 'package:flutter/material.dart';

import 'dart:async';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/mygamemanager.dart';

class MyTimer extends StatefulWidget {
  const MyTimer({super.key});

  @override
  MyTimerState createState() => MyTimerState();
}

class MyTimerState extends State<MyTimer> {
  late Stopwatch stopwatch;
  late Timer _timer;
  late Duration _elapsedTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 30), _updateTimer);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTimer(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {
        _elapsedTime = stopwatch.elapsed;
      });
      Provider.of<MyGameManager>(context, listen: false).timer =
          stopwatch.elapsedMilliseconds.toDouble();
    }
  }

  void stopTimer() {
    setState(() {
      stopwatch.stop();
    });
  }

  int get chronoValue => _elapsedTime.inMilliseconds;

  String _formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String twoDigitMilliseconds =
        twoDigits(duration.inMilliseconds.remainder(1000) ~/ 10);
    return "$twoDigitMinutes:$twoDigitSeconds.$twoDigitMilliseconds";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _formatDuration(_elapsedTime),
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
