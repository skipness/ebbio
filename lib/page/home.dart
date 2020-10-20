import 'package:ebbio/model/anime.dart';
import 'package:ebbio/model/hp.dart';
import 'package:ebbio/widget/anime_grid_view/anime_grid_view.dart';
import 'package:ebbio/widget/carousel/carousel.dart';
import 'package:ebbio/widget/on_air_header/on_air_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Hp hp;
  final List<Anime> animeList;

  Home({@required this.hp, @required this.animeList});

  @override
  Widget build(BuildContext context) {
    final filteredList = animeList
      ..where((Anime anime) => anime.isEnded < 1 && anime.isHidden < 1);
    return CupertinoPageScaffold(
      child: SafeArea(
        top: false,
        bottom: false,
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: const Text(
                'ebb.io',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Carousel(featured: hp.featured),
            OnAirHeader(),
            AnimeGridView(list: filteredList),
          ],
        ),
      ),
    );
  }
}
