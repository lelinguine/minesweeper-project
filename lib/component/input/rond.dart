import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyRond extends StatefulWidget {
  final Widget child;
  final VoidCallback action;

  const MyRond({
    super.key,
    required this.child,
    required this.action,
  });

  @override
  MyRondState createState() => MyRondState();
}

class MyRondState extends State<MyRond> {
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
          HapticFeedback.vibrate();
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
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 4,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).secondaryHeaderColor,
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
