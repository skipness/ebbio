import 'package:ebbio/model/anime_detail.dart';
import 'package:ebbio/widget/anime_detail/episode_list_view/episode_list_view_cell.dart';
import 'package:flutter/material.dart';

class EpisodeListView extends StatelessWidget {
  final List<Episode> episodes;

  EpisodeListView({@required this.episodes});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: episodes.length,
        itemBuilder: (BuildContext context, int index) =>
            EpisodeListViewCell(episode: episodes[index]),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}
