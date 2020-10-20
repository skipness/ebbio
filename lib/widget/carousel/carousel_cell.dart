import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebbio/model/hp.dart';
import 'package:ebbio/page/anime_detail.dart';
import 'package:flutter/material.dart';

class CarouselCell extends StatelessWidget {
  final Featured featured;

  CarouselCell({@required this.featured});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => AnimeDetailPage(
              animeId: featured.animeId,
              animeName: featured.nameChi,
              seasonId: featured.seasonId,
              seasonTitle: featured.seasonTitle,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${featured.seasonTitle}',
            style: TextStyle(
              color: const Color.fromRGBO(255, 255, 255, 0.65),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '${featured.nameChi}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: '${featured.posterLarge}',
                  placeholder: (BuildContext context, String url) => Container(
                    color: const Color.fromRGBO(58, 69, 85, 1),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
