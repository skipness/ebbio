import 'package:ebbio/bloc/anime_detail/anime_detail_bloc.dart';
import 'package:ebbio/bloc/anime_detail/anime_detail_event.dart';
import 'package:ebbio/bloc/anime_detail/anime_detail_state.dart';
import 'package:ebbio/repository/anime_detail.dart';
import 'package:ebbio/widget/anime_detail/anime_description.dart';
import 'package:ebbio/widget/anime_detail/anime_info.dart';
import 'package:ebbio/widget/anime_detail/anime_season_header.dart';
import 'package:ebbio/widget/anime_detail/anime_tags.dart';
import 'package:ebbio/widget/anime_detail/anime_title.dart';
import 'package:ebbio/widget/anime_detail/backdrop.dart';
import 'package:ebbio/widget/anime_detail/episode_list_view/episode_list_view.dart';
import 'package:ebbio/widget/anime_detail/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';

class AnimeDetailPage extends StatefulWidget {
  final int animeId;
  final String animeName;
  final int seasonId;
  final String seasonTitle;

  AnimeDetailPage({
    @required this.animeId,
    @required this.animeName,
    @required this.seasonId,
    @required this.seasonTitle,
  });

  @override
  _AnimeDetailPageState createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {
  AnimeDetailBloc _animeDetailBloc;
  int currentSeason = 0;
  String shareURL;

  @override
  void initState() {
    super.initState();
    _animeDetailBloc = AnimeDetailBloc(
        animeDetailRepository: AnimeDetailRepository(), id: widget.animeId);
    shareURL =
        buildSharingURL(widget.animeName, widget.seasonId, widget.seasonTitle);
  }

  String buildSharingURL(String animeName, int seasonId, String seasonTitle) =>
      'https://ebb.io/anime/${widget.animeId.toString()}x${seasonId.toString()}/$animeName-$seasonTitle';

  @override
  Widget build(context) {
    final height = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
      navigationBar: CupertinoTransparentNavigationBar(
        border: Border(bottom: BorderSide(color: Colors.transparent)),
        backgroundColor: Colors.transparent,
        trailing: CupertinoButton(
          child: const Icon(
            CupertinoIcons.square_arrow_up,
            //size: 24,
          ),
          onPressed: () => shareURL == null ? null : Share.share(shareURL),
        ),
      ),
      child: BlocBuilder<AnimeDetailBloc, AnimeDetailState>(
        cubit: _animeDetailBloc..add(FetchAnimeDetail(widget.animeId)),
        builder: (context, AnimeDetailState state) {
          if (state is AnimeDetailLoaded) {
            final anime = state.animeDetail.list.anime;
            final seasons = state.animeDetail.list.seasons;
            final season = state.animeDetail.list.seasons[currentSeason];
            return SafeArea(
              top: false,
              child: Stack(children: <Widget>[
                Positioned(
                  top: 0,
                  child: Backdrop(
                    backdropUrl:
                        'https://seaside.ebb.io/${widget.animeId.toString()}x${season.id.toString()}.jpg',
                  ),
                ),
                Positioned.fill(
                  top: height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 0.65),
                      ),
                      child: Column(
                        children: <Widget>[
                          AnimeTitle(
                            animeTitle: anime.nameChi,
                          ),
                          AnimeInfo(
                            author: anime.author,
                            lastUpdated: season.lastUpdated,
                            studio: season.studio,
                          ),
                          AnimeTags(
                            tags: anime.tags,
                          ),
                          AnimeDescription(
                            animeDescription: anime.description,
                          ),
                          AnimeSeasonHeader(
                              seasons: seasons,
                              seasonTitle: season.seasonTitle,
                              currentSelectedIndex: currentSeason,
                              onSeasonChange: (int index) => setState(() {
                                    currentSeason = index;
                                    shareURL = buildSharingURL(anime.nameChi,
                                        season.id, season.seasonTitle);
                                  })),
                          EpisodeListView(
                            episodes: season.episodes,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            );
          }
          return Container();
        },
      ),
    );
  }
}
