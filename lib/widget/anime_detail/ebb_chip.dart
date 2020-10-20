import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class EbbChip extends StatelessWidget {
  final AutoSizeGroup autoSizeGroup;
  final BorderRadiusGeometry borderRadius;
  final Color color;
  final String text;
  final Color textColor;

  const EbbChip(
      {Key key,
      this.autoSizeGroup,
      this.borderRadius,
      @required this.color,
      @required this.text,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 0.5),
      child: AutoSizeText(
        text,
        group: autoSizeGroup,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
