import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final Widget child;
  final VoidCallback action;
  final Color color;

  const MyButton({
    super.key,
    required this.child,
    required this.action,
    required this.color,
  });

  @override
  MyButtonState createState() => MyButtonState();
}

class MyButtonState extends State<MyButton> {
  late bool isSelected = false;

  late Offset pushOffset = const Offset(0, 0);
  late Offset shadowOffset = const Offset(4, 4);

  void updateOffset() {
    setState(() {
      isSelected = !isSelected;
      if (isSelected) {
        pushOffset = const Offset(4, 4);
        shadowOffset = const Offset(0, 0);
      } else {
        pushOffset = const Offset(0, 0);
        shadowOffset = const Offset(4, 4);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: pushOffset,
      child: GestureDetector(
        onTapUp: (TapUpDetails tapUpDetails) {
          updateOffset();
          widget.action();
        },
        onTapCancel: () {
          updateOffset();
        },
        onTapDown: (TapDownDetails tapDownDetails) {
          updateOffset();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              width: 4,
              color: widget.color,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.color,
                offset: shadowOffset,
              ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
