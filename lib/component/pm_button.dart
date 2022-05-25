import 'package:flutter/material.dart';

import '../theme/theme.dart';

class PmButton extends StatelessWidget {
  const PmButton.secondary({
    Key? key,
    required this.text,
    required this.onPressed,
  })  : color = primary100,
        textColor = primary,
        super(key: key);

  const PmButton.primary({
    Key? key,
    required this.text,
    required this.onPressed,
  })  : color = primary,
        textColor = Colors.white,
        super(key: key);

  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Text(
        text,
        style: bodyBold.copyWith(color: textColor),
      ),
    );
  }
}
