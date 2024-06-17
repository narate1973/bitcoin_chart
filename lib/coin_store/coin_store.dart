import 'dart:async';

import 'package:bitcoin_chart_assignment/core/app_shared_preference.dart';
import 'package:bitcoin_chart_assignment/core/app_store.dart';
import 'package:bitcoin_chart_assignment/data/bitcoin_price_response.dart';
import 'package:bitcoin_chart_assignment/data/coin_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_intent.dart';

part 'coin_viewState.dart';

part 'coin_store.freezed.dart';

final coinStoreProvider = AutoDisposeAppStateNotifierProvider<CoinStoreNotifier, CoinViewState>((ref) {
  return CoinStoreNotifier(
    ref.watch(coinRepoProvider),
    ref.watch(appSharedPreferenceProvider),
  );
});

class CoinStoreNotifier extends AppStateNotifier<CoinIntent, CoinViewState> {
  final CoinRepo _coinRepo;
  late final StreamSubscription<BitCoinPriceResponse> _coinPriceSubscription;
  final AppSharedPreference _appSharedPreference;

  CoinStoreNotifier(this._coinRepo, this._appSharedPreference) : super(const CoinViewState());

  @override
  void dispose() {
    _coinPriceSubscription.cancel();
    super.dispose();
  }

  @override
  AppStateNotifierResult mapIntentToState(CoinIntent intent) async {
    switch (intent) {
      case CoinInitialized():
        final cachedBitCoinPriceData = _appSharedPreference.getBitCoinPriceData();
        state = state.copyWith(bitCoinPriceData: cachedBitCoinPriceData);
        _coinPriceSubscription = _coinRepo.getBitCoinPrice().listen((bitCoinPriceResponse) async {
          state = state.copyWith(bitCoinPriceData: [...state.bitCoinPriceData, bitCoinPriceResponse]);
          await _appSharedPreference.setBitCoinPriceData(state.bitCoinPriceData);
        });
        break;
    }
  }
}
