import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'bitcoin_price_response.freezed.dart';
part 'bitcoin_price_response.g.dart';

BitCoinPriceResponse bitCoinPriceResponseFromJson(String str) => BitCoinPriceResponse.fromJson(json.decode(str));

String bitCoinPriceResponseToJson(BitCoinPriceResponse data) => json.encode(data.toJson());

@freezed
class BitCoinPriceResponse with _$BitCoinPriceResponse {
  const factory BitCoinPriceResponse({
    required Time time,
    required String disclaimer,
    required String chartName,
    required Map<String, BitCoinPriceIndexDetail> bpi,
  }) = _BitCoinPriceResponse;

  factory BitCoinPriceResponse.fromJson(Map<String, dynamic> json) => _$BitCoinPriceResponseFromJson(json);
}

@freezed
class BitCoinPriceIndexDetail with _$BitCoinPriceIndexDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BitCoinPriceIndexDetail({
    required String code,
    required String symbol,
    required String rate,
    required String description,
    required double rateFloat,
  }) = _BitCoinPriceIndexDetail;

  factory BitCoinPriceIndexDetail.fromJson(Map<String, dynamic> json) => _$BitCoinPriceIndexDetailFromJson(json);
}

@freezed
class Time with _$Time {
  const factory Time({
    required String updated,
    required DateTime updatedISO,
    required String updateduk,
  }) = _Time;

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);
}
