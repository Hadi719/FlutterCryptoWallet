class KApisStrings {
  static const KCoinCapStrings coinCap = KCoinCapStrings();
  static const KCoinExStrings coinEx = KCoinExStrings();
  static const KGeckoStrings gecko = KGeckoStrings();
}

class KCoinCapStrings {
  const KCoinCapStrings();

  static const String baseUrl = 'https://api.coincap.io/v2';
  static const String pathAsset = '/assets/{id}';
  static const String pathAssetHistory = '/assets/{id}/history';
  static const String pathAssetMarkets = '/assets/{id}/markets';
  static const String pathAssetsList = '/assets';
  static const String pathCandlesList = '/candles';
  static const String pathExchange = '/exchanges/{id}';
  static const String pathExchangesList = '/exchanges';
  static const String pathMarketsList = '/markets';
  static const String pathRate = '/rates/{id}';
  static const String pathRatesList = '/rates';
}

class KCoinExStrings {
  const KCoinExStrings();

  static const String baseUrl = 'https://api.coinex.com/v1';
  static const String pathAllMarketInfo = '/market/info';
  static const String pathAllMarketList = '/market/list';
  static const String pathAllMarketStatistics = '/market/ticker/all';
  static const String pathCurrencyRate = '/common/currency/rate';
  static const String pathKLineData = '/market/kline';
  static const String pathLatestTransactionData = '/market/deals';
  static const String pathMarketDepth = '/market/depth';
  static const String pathSingleMarketInfo = '/market/detail';
  static const String pathSingleMarketStatistics = '/market/ticker';
}

class KGeckoStrings {
  const KGeckoStrings();

  static const String baseUrl = 'https://api.coingecko.com/api/v3';
  static const String pathAssetPlatformsList = '/asset_platforms';
  static const String pathCoinHistory = '/coins/{id}/history';
  static const String pathCoinMarketChart = '/coins/{id}/market_chart';
  static const String pathCoinMarketChartRange =
      '/coins/{id}/market_chart/range';
  static const String pathCoinMetaData = '/coins/{id}';
  static const String pathCoinOHLC = '/coins/{id}/ohlc';
  static const String pathCoinsList = '/coins/list';
  static const String pathCoinsMarketsList = '/coins/markets';
  static const String pathCoinTickers = '/coins/{id}/tickers';
  static const String pathExchangeRates = '/exchange_rates';
  static const String pathSimplePricesList = '/simple/price';
  static const String pathSimpleSupportedVsCurrencies =
      '/simple/supported_vs_currencies';
}
