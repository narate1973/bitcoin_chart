part of 'coin_store.dart';

sealed class CoinIntent extends AppEvent {
  const CoinIntent();
}

class CoinInitialized extends CoinIntent {
  const CoinInitialized();

  @override
  List<Object?> get props => [];
}
