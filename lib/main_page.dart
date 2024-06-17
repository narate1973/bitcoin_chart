import 'package:bitcoin_chart_assignment/coin_convert_tab_page.dart';
import 'package:bitcoin_chart_assignment/coin_list_tab_page.dart';
import 'package:bitcoin_chart_assignment/coin_store/coin_store.dart';
import 'package:bitcoin_chart_assignment/core/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainPageIndexValueNotifierProvider = ChangeNotifierProvider.autoDispose<ValueNotifier<int>>((ref) {
  return ValueNotifier(0);
});

class MainPage extends AppHookConsumerWidget<CoinStoreNotifier, CoinViewState> {
  const MainPage({super.key});

  @override
  AutoDisposeAppStateNotifierProvider<CoinStoreNotifier, CoinViewState> get stateNotifierProvider => coinStoreProvider;

  @override
  Widget buildWidget(BuildContext context, WidgetRef ref, CoinViewState state, StoreDispatch dispatch) {
    final pageIndex = ref.watch(mainPageIndexValueNotifierProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // await dispatch(const CoinInitializedUseMock());
        await dispatch(const CoinInitialized());
      });
      return null;
    }, const []);

    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        if (coinListTabPageNavigatorKey.currentState?.canPop() == true) {
          coinListTabPageNavigatorKey.currentState?.pop();
        } else {
          SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: IndexedStack(
          index: pageIndex.value,
          children: const [
            CoinListTabPage(),
            CoinConvertTabPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          currentIndex: pageIndex.value,
          onTap: (index) {
            pageIndex.value = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.currency_bitcoin),
              label: 'Bitcoid',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.currency_exchange),
              label: 'Convert',
            ),
          ],
        ),
      ),
    );
  }
}
