import 'package:flutter/material.dart';

class MyField extends StatelessWidget {
  const MyField({
    Key? key,
    required this.height,
    required this.width,
    this.controller, // Ajouter le contrôleur de texte comme un paramètre nommé
  }) : super(key: key);

  final double height, width;
  final TextEditingController? controller; // Déclarer le contrôleur de texte

  @override
  Widget build(BuildContext context) {
    final secondaryHeaderColor = Theme.of(context).secondaryHeaderColor;
    final bodyMediumTextStyle = Theme.of(context).textTheme.bodyMedium;

    return SizedBox(
      height: height,
      width: width,
      child: Theme(
        data: Theme.of(context).copyWith(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: secondaryHeaderColor,
            selectionColor: Colors.grey,
          ),
        ),
        child: TextField(
          controller: controller, // Utiliser le contrôleur de texte ici
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(24),
            ),
            filled: true,
            fillColor: Theme.of(context).primaryColor,
            labelStyle: TextStyle(
              color: secondaryHeaderColor,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 4,
                color: secondaryHeaderColor,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 4,
                color: secondaryHeaderColor,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            hoverColor: Colors.transparent,
          ),
          style: bodyMediumTextStyle,
        ),
      ),
    );
  }
}
