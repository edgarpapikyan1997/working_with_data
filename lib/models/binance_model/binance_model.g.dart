// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BinanceModel _$BinanceModelFromJson(Map<String, dynamic> json) => BinanceModel(
      e: json['e'] as String?,
      E: json['E'] as int?,
      s: json['s'] as String?,
      t: json['t'] as int?,
      p: json['p'] as String?,
      q: json['q'] as String?,
      b: json['b'] as int?,
      a: json['a'] as int?,
      T: json['T'] as int?,
      m: json['m'] as bool?,
      M: json['M'] as bool?,
    );

Map<String, dynamic> _$BinanceModelToJson(BinanceModel instance) =>
    <String, dynamic>{
      'e': instance.e,
      'E': instance.E,
      's': instance.s,
      't': instance.t,
      'p': instance.p,
      'q': instance.q,
      'b': instance.b,
      'a': instance.a,
      'T': instance.T,
      'm': instance.m,
      'M': instance.M,
    };
