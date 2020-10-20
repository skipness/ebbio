import 'package:bloc/bloc.dart';
import 'package:ebbio/bloc/hp/hp_event.dart';
import 'package:ebbio/bloc/hp/hp_state.dart';
import 'package:ebbio/repository/hp.dart';
import 'package:meta/meta.dart';

class HpBloc extends Bloc<HpEvent, HpState> {
  final HpRepository hpRepository;

  HpBloc({@required this.hpRepository}) : super(HpUninitialized());

  @override
  Stream<HpState> mapEventToState(HpEvent event) async* {
    try {
      if (event is FetchHp) {
        final result = await hpRepository.getHp();
        yield HpLoaded(hp: result);
      }
    } catch (_) {
      yield HpError();
    }
  }
}
