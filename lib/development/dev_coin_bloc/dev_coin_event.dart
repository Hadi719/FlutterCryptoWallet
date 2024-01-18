part of 'dev_coin_bloc.dart';

sealed class DevCoinEvent extends Equatable {
  const DevCoinEvent();

  @override
  List<Object> get props => [];
}

final class DevCoinChangeApi extends DevCoinEvent {}

// CoinCap
final class DevCoinCapAssetsList extends DevCoinEvent {}

// CoinEX
final class DevCoinExAllMarketList extends DevCoinEvent {}

final class DevCoinExAllMarketInfo extends DevCoinEvent {}

final class DevCoinExSingleMarketInfo extends DevCoinEvent {}

final class DevCoinExMarketDepth extends DevCoinEvent {}

final class DevCoinExLatestTransactionData extends DevCoinEvent {}

final class DevCoinExKLineData extends DevCoinEvent {}

final class DevCoinExSingleMarketStatistics extends DevCoinEvent {}

final class DevCoinExAllMarketStatistics extends DevCoinEvent {}

final class DevCoinExCurrencyRate extends DevCoinEvent {}
