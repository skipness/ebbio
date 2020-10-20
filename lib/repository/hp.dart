import 'package:ebbio/model/hp.dart';
import 'package:ebbio/network/api_provider.dart';

class HpRepository {
  Future<Hp> getHp() {
    return ApiProvider().getHP();
  }
}
