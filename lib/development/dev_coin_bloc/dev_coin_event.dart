part of 'dev_coin_bloc.dart';

sealed class DevCoinEvent extends Equatable {
  const DevCoinEvent();

  @override
  List<Object> get props => [];
}

final class DevCoinChangeApi extends DevCoinEvent {}

// CoinGecko -- Simple
final class DevCoinGeckoSimplePricesList extends DevCoinEvent {}

final class DevCoinGeckoSimpleSupportedVsCurrencies extends DevCoinEvent {}

// CoinCap -- Assets
final class DevCoinCapAssetsList extends DevCoinEvent {}

final class DevCoinCapAsset extends DevCoinEvent {}

final class DevCoinCapAssetHistories extends DevCoinEvent {}

final class DevCoinCapAssetMarkets extends DevCoinEvent {}

// CoinCap -- Rates
final class DevCoinCapRatesList extends DevCoinEvent {}

final class DevCoinCapRate extends DevCoinEvent {}

// CoinCap -- Exchanges
final class DevCoinCapExchangesList extends DevCoinEvent {}

final class DevCoinCapExchange extends DevCoinEvent {}

// CoinCap -- Markets
final class DevCoinCapMarketsList extends DevCoinEvent {}

// CoinCap -- Candles
final class DevCoinCapCandlesList extends DevCoinEvent {}

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
