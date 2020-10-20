import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Backdrop extends StatelessWidget {
  final String backdropUrl;

  Backdrop({
    @required this.backdropUrl,
  });

  @override
  Widget build(BuildContext context) {
    final backdropHeight = MediaQuery.of(context).size.height * 0.5;
    final backdropWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        CachedNetworkImage(
          fit: BoxFit.cover,
          height: backdropHeight,
          imageUrl: '$backdropUrl',
          width: backdropWidth,
          placeholder: (BuildContext context, String url) => Container(
            color: const Color.fromRGBO(31, 32, 35, 1),
            height: backdropHeight,
            width: backdropWidth,
          ),
        ),
        Container(
          height: backdropHeight,
          width: backdropWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
              colors: [
                const Color.fromRGBO(31, 32, 35, 1),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
