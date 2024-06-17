part of 'coin_store.dart';

@freezed
class CoinViewState with _$CoinViewState {
  const CoinViewState._();

  const factory CoinViewState({
    @Default([]) List<BitCoinPriceResponse> bitCoinPriceData,
    @Default([]) List<BitCoinPriceResponse> historicalPriceData,
  }) = _CoinViewState;
}