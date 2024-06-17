import 'package:bitcoin_chart_assignment/coin_store/coin_store.dart';
import 'package:bitcoin_chart_assignment/core/app_store.dart';
import 'package:bitcoin_chart_assignment/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html_unescape/html_unescape_small.dart';

import 'core/components/app_text_fom_field.dart';

class CoinConvertTabPage extends AppHookConsumerWidget<CoinStoreNotifier, CoinViewState> {
  const CoinConvertTabPage({super.key});

  @override
  AutoDisposeAppStateNotifierProvider<CoinStoreNotifier, CoinViewState> get stateNotifierProvider => coinStoreProvider;

  @override
  Widget buildWidget(
    BuildContext context,
    WidgetRef ref,
    CoinViewState state,
    StoreDispatch dispatch,
  ) {
    final amountController = useTextEditingController();
    final convertedController = useTextEditingController();

    if (state.bitCoinPriceData.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final currenciesMap = state.bitCoinPriceData.first.bpi;
    final currentCurrency = useState(currenciesMap.keys.first);
    final currencySymbol = convertHtmlUnescape(currenciesMap[currentCurrency.value]!.symbol);

    useEffect(() {
      void onCurrencyChanged() {
        final convertedValue =
            (double.tryParse(amountController.text) ?? 0) / currenciesMap[currentCurrency.value]!.rateFloat;
        convertedController.text = convertedValue.toStringAsFixed(2);
      }
      currentCurrency.addListener(onCurrencyChanged);
      return () => currentCurrency.removeListener(onCurrencyChanged);
    }, []);

    useEffect(() {
      void onAmountChanged() {
        final convertedValue =
            (double.tryParse(amountController.text) ?? 0) / currenciesMap[currentCurrency.value]!.rateFloat;
        convertedController.text = convertedValue.toStringAsFixed(2);
      }

      amountController.addListener(onAmountChanged);
      return () => amountController.removeListener(onAmountChanged);
    }, []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Convert', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            AppTextField(
              hintText: 'Amount',
              keyboardType: TextInputType.number,
              controller: amountController,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  currencySymbol,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              suffixIconOnFocus: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: currentCurrency.value,
                  items: currenciesMap.keys.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    if (value != null) {
                      currentCurrency.value = value;
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Icon(Icons.unfold_more, size: 32),
            const SizedBox(height: 8),
            AppTextField(
              hintText: 'Converted',
              keyboardType: TextInputType.number,
              controller: convertedController,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  '฿',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              suffixIconOnFocus: SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: Text(
                    'BTC',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
