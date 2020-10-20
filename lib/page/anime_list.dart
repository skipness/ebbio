import 'package:ebbio/bloc/anime_list/anime_list_bloc.dart';
import 'package:ebbio/bloc/anime_list/anime_list_state.dart';
import 'package:ebbio/model/anime.dart';
import 'package:ebbio/widget/anime_grid_view/anime_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeListPage extends StatelessWidget {
  @override
  Widget build(context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        top: false,
        bottom: false,
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: const Text(
                '動畫列表',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            BlocBuilder<AnimeListBloc, AnimeListState>(
              cubit: BlocProvider.of<AnimeListBloc>(context),
              builder: (context, AnimeListState state) {
                if (state is AnimeListLoaded) {
                  return AnimeGridView(
                      list: state.animeList
                          .where((Anime anime) => anime.isHidden < 1)
                          .toList());
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
