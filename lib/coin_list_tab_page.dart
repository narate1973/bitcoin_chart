import 'package:bitcoin_chart_assignment/bitcoin_chart_page.dart';
import 'package:bitcoin_chart_assignment/coin_store/coin_store.dart';
import 'package:bitcoin_chart_assignment/core/app_store.dart';
import 'package:bitcoin_chart_assignment/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html_unescape/html_unescape_small.dart';

final coinListTabPageNavigatorKey = GlobalKey<NavigatorState>();

class CoinListTabPage extends StatelessWidget {
  Route<dynamic> asRoute() {
    return MaterialPageRoute(
      builder: (context) => this,
      settings: const RouteSettings(name: name),
    );
  }

  static const name = 'CoinListTabPage';

  const CoinListTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: coinListTabPageNavigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return const _CoinListTabPageContent();
          },
        );
      },
    );
  }
}

class _CoinListTabPageContent extends AppHookConsumerWidget<CoinStoreNotifier, CoinViewState> {
  const _CoinListTabPageContent();

  @override
  AutoDisposeAppStateNotifierProvider<CoinStoreNotifier, CoinViewState> get stateNotifierProvider => coinStoreProvider;

  @override
  Widget buildWidget(
    BuildContext context,
    WidgetRef ref,
    CoinViewState state,
    StoreDispatch dispatch,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text('Bitcoin', style: Theme.of(context).textTheme.headlineSmall),
            Text(
              state.bitCoinPriceData.firstOrNull?.time.updated ?? '',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: state.bitCoinPriceData.isEmpty
            ? const [
                Center(child: CircularProgressIndicator()),
              ]
            : state.bitCoinPriceData.first.bpi.values.map((value) {
                final currencySymbol = convertHtmlUnescape(value.symbol);
                return CurrencyListTile(
                  onTap: () {
                    Navigator.push(
                      coinListTabPageNavigatorKey.currentState!.context,
                      BitcoinChartPage(
                        currencyName: value.code,
                        currencySymbol: currencySymbol,
                      ).asRoute(),
                    );
                  },
                  name: value.code,
                  price: value.rate,
                  priceWithCurrency: '$currencySymbol ${value.rate}',
                );
              }).toList(),
        // children: [
        //   CurrencyListTile(
        //     onTap: () {
        //       Navigator.push(
        //         coinListTabPageNavigatorKey.currentState!.context,
        //         const BitcoinChartPage(
        //           currencyName: 'USD',
        //         ).asRoute(),
        //       );
        //     },
        //     name: 'USD',
        //     price: '3,000,000',
        //     priceWithCurrency: r'$ 3,000,000',
        //   ),
        //   const Divider(thickness: 1, height: 1),
        //   CurrencyListTile(
        //     onTap: () {
        //       Navigator.push(
        //         coinListTabPageNavigatorKey.currentState!.context,
        //         const BitcoinChartPage(
        //           currencyName: 'GBP',
        //         ).asRoute(),
        //       );
        //     },
        //     name: 'USD',
        //     price: '3,000,000',
        //     priceWithCurrency: r'$ 3,000,000',
        //   ),
        //   const Divider(thickness: 1, height: 1),
        //   CurrencyListTile(
        //     onTap: () {
        //       Navigator.push(
        //         coinListTabPageNavigatorKey.currentState!.context,
        //         const BitcoinChartPage(
        //           currencyName: 'EUR',
        //         ).asRoute(),
        //       );
        //     },
        //     name: 'USD',
        //     price: '3,000,000',
        //     priceWithCurrency: r'$ 3,000,000',
        //   ),
        // ],
      ),
    );
  }
}

class CurrencyListTile extends StatelessWidget {
  final String name;
  final String price;
  final String priceWithCurrency;
  final VoidCallback onTap;

  const CurrencyListTile({
    super.key,
    required this.name,
    required this.price,
    required this.priceWithCurrency,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text.rich(
        TextSpan(
          text: 'Bitcoin',
          style: Theme.of(context).textTheme.headlineMedium,
          children: [
            TextSpan(
              text: ' / $name',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(price, style: Theme.of(context).textTheme.titleLarge),
              Text(priceWithCurrency, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
