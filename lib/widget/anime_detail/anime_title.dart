import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AnimeTitle extends StatelessWidget {
  final String animeTitle;

  AnimeTitle({@required this.animeTitle});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      '$animeTitle',
      overflow: TextOverflow.ellipsis,
      maxFontSize: 36,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.3
      ),
    );
  }
}
