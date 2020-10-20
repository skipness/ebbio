import 'package:bloc/bloc.dart';
import 'package:ebbio/bloc/anime_list/anime_list_event.dart';
import 'package:ebbio/bloc/anime_list/anime_list_state.dart';
import 'package:ebbio/repository/anime_list.dart';
import 'package:meta/meta.dart';

class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {
  final AnimeListRepository animeListRepository;

  AnimeListBloc({@required this.animeListRepository})
      : super(AnimeListUninitialized());

  @override
  Stream<AnimeListState> mapEventToState(AnimeListEvent event) async* {
    try {
      if (event is FetchAnimeList) {
        final result = await animeListRepository.getAnimeList();
        yield AnimeListLoaded(animeList: result);
      }
    } catch (_) {
      yield AnimeListError();
    }
  }
}
