part of 'dev_coin_bloc.dart';

sealed class DevCoinEvent extends Equatable {
  const DevCoinEvent();

  @override
  List<Object> get props => [];
}

final class DevCoinChangeApi extends DevCoinEvent {}

final class DevCoinGetDownloadLink extends DevCoinEvent {
  const DevCoinGetDownloadLink({required this.downloadLink});

  final String downloadLink;
}

final class DevCoinCapAsset extends DevCoinEvent {}

final class DevCoinCapAssetHistories extends DevCoinEvent {}

final class DevCoinCapAssetMarkets extends DevCoinEvent {}

final class DevCoinCapAssetsList extends DevCoinEvent {}

final class DevCoinCapCandlesList extends DevCoinEvent {}

final class DevCoinCapExchange extends DevCoinEvent {}

final class DevCoinCapExchangesList extends DevCoinEvent {}

final class DevCoinCapMarketsList extends DevCoinEvent {}

final class DevCoinCapRate extends DevCoinEvent {}

final class DevCoinCapRatesList extends DevCoinEvent {}

final class DevCoinExAllMarketInfo extends DevCoinEvent {}

final class DevCoinExAllMarketList extends DevCoinEvent {}

final class DevCoinExAllMarketStatistics extends DevCoinEvent {}

final class DevCoinExCurrencyRate extends DevCoinEvent {}

final class DevCoinExKLineData extends DevCoinEvent {}

final class DevCoinExLatestTransactionData extends DevCoinEvent {}

final class DevCoinExMarketDepth extends DevCoinEvent {}

final class DevCoinExSingleMarketInfo extends DevCoinEvent {}

final class DevCoinExSingleMarketStatistics extends DevCoinEvent {}

final class DevCoinGeckoAssetPlatformsList extends DevCoinEvent {}

final class DevCoinGeckoCoinHistory extends DevCoinEvent {}

final class DevCoinGeckoCoinMarketChart extends DevCoinEvent {}

final class DevCoinGeckoCoinMarketChartRange extends DevCoinEvent {}

final class DevCoinGeckoCoinMetadata extends DevCoinEvent {}

final class DevCoinGeckoCoinOHLC extends DevCoinEvent {}

final class DevCoinGeckoCoinsMarketsList extends DevCoinEvent {}

final class DevCoinGeckoExchangeRates extends DevCoinEvent {}

final class DevCoinGeckoSimplePricesList extends DevCoinEvent {}

final class DevCoinGeckoSimpleSupportedVsCurrencies extends DevCoinEvent {}

final class DevCoinGeckoFsUploadCoinHistory extends DevCoinEvent {}

final class DevCoinGeckoFsDownloadCoinHistory extends DevCoinEvent {}

final class DevCoinGeckoFsUploadCoinsMarketsList extends DevCoinEvent {}

final class DevCoinGeckoFsDownloadCoinsMarketsList extends DevCoinEvent {}
