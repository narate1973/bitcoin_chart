import 'package:bitcoin_chart_assignment/data/bitcoin_price_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final coinRepoProvider = Provider<CoinRepo>((ref) {
  return _CoinRepoImpl();
});

abstract class CoinRepo {
  Stream<BitCoinPriceResponse> getBitCoinPrice();
}

final class _CoinRepoImpl implements CoinRepo {
  @override
  Stream<BitCoinPriceResponse> getBitCoinPrice() async* {
    while (true) {
      final response = await http.get(Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'));
      final bitCoinPriceResponse = bitCoinPriceResponseFromJson(response.body);
      yield bitCoinPriceResponse;
      await Future.delayed(const Duration(seconds: 10));
    }
  }
}
