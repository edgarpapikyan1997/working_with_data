import 'package:json_annotation/json_annotation.dart';
part 'binance_model.g.dart';

@JsonSerializable()
class BinanceModel {
  String? e;
  int? E;
  String? s;
  int? t;
  String? p;
  String? q;
  int? b;
  int? a;
  int? T;
  bool? m;
  bool? M;

  BinanceModel({
    this.e,
    this.E,
    this.s,
    this.t,
    this.p,
    this.q,
    this.b,
    this.a,
    this.T,
    this.m,
    this.M,
  });

  factory BinanceModel.fromJson(Map<String, dynamic> json) =>
      _$BinanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$BinanceModelToJson(this);
}

// flutter: {"e":"trade","E":1701955609184,"s":"ETHEUR","t":91633159,"p":"2089.19000000","q":"0.10030000","b":2531769676,"a":2531769660,"T":1701955609166,"m":false,"M":true}
