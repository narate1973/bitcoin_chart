// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bitcoin_price_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BitCoinPriceResponseImpl _$$BitCoinPriceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BitCoinPriceResponseImpl(
      time: Time.fromJson(json['time'] as Map<String, dynamic>),
      disclaimer: json['disclaimer'] as String,
      chartName: json['chartName'] as String,
      bpi: (json['bpi'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, BitCoinPriceIndexDetail.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$BitCoinPriceResponseImplToJson(
        _$BitCoinPriceResponseImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'disclaimer': instance.disclaimer,
      'chartName': instance.chartName,
      'bpi': instance.bpi,
    };

_$BitCoinPriceIndexDetailImpl _$$BitCoinPriceIndexDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$BitCoinPriceIndexDetailImpl(
      code: json['code'] as String,
      symbol: json['symbol'] as String,
      rate: json['rate'] as String,
      description: json['description'] as String,
      rateFloat: (json['rate_float'] as num).toDouble(),
    );

Map<String, dynamic> _$$BitCoinPriceIndexDetailImplToJson(
        _$BitCoinPriceIndexDetailImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'symbol': instance.symbol,
      'rate': instance.rate,
      'description': instance.description,
      'rate_float': instance.rateFloat,
    };

_$TimeImpl _$$TimeImplFromJson(Map<String, dynamic> json) => _$TimeImpl(
      updated: json['updated'] as String,
      updatedISO: DateTime.parse(json['updatedISO'] as String),
      updateduk: json['updateduk'] as String,
    );

Map<String, dynamic> _$$TimeImplToJson(_$TimeImpl instance) =>
    <String, dynamic>{
      'updated': instance.updated,
      'updatedISO': instance.updatedISO.toIso8601String(),
      'updateduk': instance.updateduk,
    };
