import 'package:ebbio/model/hp.dart';

abstract class HpState {}

class HpUninitialized extends HpState {
  @override
  String toString() => 'Hp Uninitialized';
}

class HpError extends HpState {
  @override
  String toString() => 'Hp Error';
}

class HpLoaded extends HpState {
  final Hp hp;

  HpLoaded({
    this.hp,
  });

  @override
  String toString() => 'Hp Loaded { hp: $hp';
}
