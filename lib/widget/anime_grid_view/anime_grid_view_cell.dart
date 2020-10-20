import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebbio/model/anime.dart';
import 'package:ebbio/page/anime_detail.dart';
import 'package:flutter/material.dart';

class AnimeGridViewCell extends StatelessWidget {
  final Anime anime;

  AnimeGridViewCell({@required this.anime});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => AnimeDetailPage(
              animeId: anime.animeId,
              animeName: anime.nameChi,
              seasonId: anime.seasonId,
              seasonTitle: anime.seasonTitle,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      'https://seaside.ebb.io/${anime.animeId.toString()}x${anime.seasonId.toString()}.jpg',
                  placeholder: (BuildContext context, String url) => Container(
                    color: const Color.fromRGBO(58, 69, 85, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${anime.nameChi}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              '${anime.seasonTitle}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: const Color.fromRGBO(255, 255, 255, 0.65),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
