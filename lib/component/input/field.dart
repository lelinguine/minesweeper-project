import 'package:flutter/material.dart';

class MyField extends StatelessWidget {
  const MyField({super.key, required this.height, required this.width});

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            filled: true,
            fillColor: Theme.of(context).primaryColor,
            labelStyle: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 4,
                color: Theme.of(context).secondaryHeaderColor,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 4,
                color: Theme.of(context).secondaryHeaderColor,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            hoverColor: Colors.transparent,
          ),
        ));
  }
}
