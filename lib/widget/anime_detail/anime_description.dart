import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AnimeDescription extends StatelessWidget {
  final String animeDescription;

  AnimeDescription({@required this.animeDescription});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      '$animeDescription',
      overflow: TextOverflow.ellipsis,
      minFontSize: 14,
      maxFontSize: 16,
      maxLines: 4,
      stepGranularity: 0.1,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.w300, letterSpacing: 1.1),
    );
  }
}
