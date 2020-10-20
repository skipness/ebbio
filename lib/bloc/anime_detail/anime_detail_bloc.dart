import 'package:bloc/bloc.dart';
import 'package:ebbio/bloc/anime_detail/anime_detail_event.dart';
import 'package:ebbio/bloc/anime_detail/anime_detail_state.dart';
import 'package:ebbio/repository/anime_detail.dart';
import 'package:meta/meta.dart';

class AnimeDetailBloc extends Bloc<AnimeDetailEvent, AnimeDetailState> {
  final AnimeDetailRepository animeDetailRepository;
  final int id;

  AnimeDetailBloc({@required this.animeDetailRepository, @required this.id})
      : super(AnimeDetailUninitialized());

  @override
  Stream<AnimeDetailState> mapEventToState(AnimeDetailEvent event) async* {
    final currentState = state;
    try {
      if (currentState is AnimeDetailUninitialized) {
        final result = await animeDetailRepository.getAnimeDetail(event.id);
        yield AnimeDetailLoaded(animeDetail: result);
      }
    } catch (_) {
      yield AnimeDetailError();
    }
  }
}
