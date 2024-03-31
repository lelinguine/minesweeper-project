import 'package:flutter/material.dart';
import 'package:minesweeper/context.dart';

class MyAnimate extends StatefulWidget {
  const MyAnimate({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAnimateState createState() => _MyAnimateState();
}

class _MyAnimateState extends State<MyAnimate>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.9,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Image.asset(
            '${context.getAssets()}bomb.png',
            width: 40,
            height: 40,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
