import 'package:ebbio/model/anime.dart';
import 'package:ebbio/widget/anime_grid_view/anime_grid_view_cell.dart';
import 'package:flutter/material.dart';

class AnimeGridView extends StatelessWidget {
  final List<Anime> list;

  AnimeGridView({@required this.list});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 160,
            childAspectRatio: 9 / 16,
            mainAxisSpacing: 10.0),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) => AnimeGridViewCell(
            anime: list[index],
          ),
          childCount: list.length,
        ),
      ),
    );
  }
}
