import 'dart:io';

import 'package:bitcoin_chart_assignment/coin_store/coin_store.dart';
import 'package:bitcoin_chart_assignment/core/app_store.dart';
import 'package:bitcoin_chart_assignment/simple_chart/simple_chart.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transition/page_transition.dart';

class BitcoinChartPage extends AppHookConsumerWidget<CoinStoreNotifier, CoinViewState> {
  final String currencyName;
  final String currencySymbol;

  Route<bool> asRoute() {
    if (Platform.isAndroid) {
      return PageTransition(
        type: PageTransitionType.rightToLeft,
        child: this,
        settings: const RouteSettings(name: name),
      );
    }

    return MaterialPageRoute(
      builder: (context) => this,
      settings: const RouteSettings(name: name),
    );
  }

  static const String name = 'BitcoinChartPage';

  const BitcoinChartPage({
    super.key,
    required this.currencyName,
    required this.currencySymbol,
  });

  @override
  AutoDisposeAppStateNotifierProvider<CoinStoreNotifier, CoinViewState> get stateNotifierProvider => coinStoreProvider;

  @override
  Widget buildWidget(BuildContext context, WidgetRef ref, CoinViewState state, StoreDispatch dispatch) {
    final latestPrice = state.bitCoinPriceData.firstOrNull?.bpi[currencyName]!.rateFloat;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bitcoin / $currencyName', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  latestPrice.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  '~ $currencySymbol $latestPrice',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 300,
              child: SimpleChart(currencyName: currencyName),
            ),
          ],
        ),
      ),
    );
  }
}
