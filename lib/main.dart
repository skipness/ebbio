import 'package:ebbio/bloc/anime_list/anime_list_bloc.dart';
import 'package:ebbio/bloc/anime_list/anime_list_event.dart';
import 'package:ebbio/bloc/anime_list/anime_list_state.dart';
import 'package:ebbio/bloc/hp/hp_bloc.dart';
import 'package:ebbio/bloc/hp/hp_event.dart';
import 'package:ebbio/bloc/hp/hp_state.dart';
import 'package:ebbio/model/hp.dart';
import 'package:ebbio/page/home.dart';
import 'package:ebbio/page/loading.dart';
import 'package:ebbio/repository/anime_list.dart';
import 'package:ebbio/repository/hp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<HpBloc>(
              create: (_) => HpBloc(hpRepository: HpRepository())),
          BlocProvider<AnimeListBloc>(
              create: (_) =>
                  AnimeListBloc(animeListRepository: AnimeListRepository()))
        ],
        child: App(),
      ),
    ),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  HpBloc _hpBloc;
  AnimeListBloc _animeListBloc;

  @override
  void initState() {
    _hpBloc = BlocProvider.of<HpBloc>(context);
    _animeListBloc = BlocProvider.of<AnimeListBloc>(context);
    super.initState();
  }

  BlocBuilder hpBlocBuilder() => BlocBuilder<HpBloc, HpState>(
        cubit: _hpBloc..add(FetchHp()),
        builder: (context, HpState state) {
          switch (state.runtimeType) {
            case HpUninitialized:
              return LoadingPage();
            case HpError:
              return Container();
            case HpLoaded:
              return animeListBlocBuilder((state as HpLoaded).hp);
            default:
              return Container();
          }
        },
      );

  BlocBuilder animeListBlocBuilder(Hp hp) =>
      BlocBuilder<AnimeListBloc, AnimeListState>(
        cubit: _animeListBloc..add(FetchAnimeList()),
        builder: (context, AnimeListState state) {
          switch (state.runtimeType) {
            case AnimeListUninitialized:
              return LoadingPage();
            case AnimeListError:
              return Container();
            case AnimeListLoaded:
              return Home(
                  hp: hp, animeList: (state as AnimeListLoaded).animeList);
            default:
              return Container();
          }
        },
      );

  @override
  Widget build(context) {
    return CupertinoApp(
      home: hpBlocBuilder(),
      theme: CupertinoThemeData(
        primaryColor: const Color.fromRGBO(117, 179, 240, 1),
        barBackgroundColor: const Color.fromRGBO(31, 32, 35, 1),
        scaffoldBackgroundColor: const Color.fromRGBO(31, 32, 35, 1),
        textTheme: CupertinoTextThemeData(
          primaryColor: const Color.fromRGBO(117, 179, 240, 1),
          textStyle: TextStyle(
            color: const Color.fromRGBO(255, 255, 255, 0.9),
          ),
        ),
      ),
    );
  }
}
