class KFirebaseStrings {
  static const KFirebaseStorageStrings storage = KFirebaseStorageStrings();
}

class KFirebaseStorageStrings {
  const KFirebaseStorageStrings();

  static const String nameAPIsData = 'APIsData';
  static const String pathAPIsData = 'APIsData';
  static const String nameGecko = 'Gecko';
  static const String pathGecko = '$pathAPIsData/Gecko';
  static const String nameGeckoCoins = 'Coins';
  static const String pathGeckoCoins = '$pathGecko/Coins';
  static const String nameGeckoHistory = 'History';
  static const String pathGeckoHistory = '$pathGeckoCoins/History';
  static const String nameGeckoMarketChart = 'MarketChart';
  static const String pathGeckoMarketChart = '$pathGeckoCoins/MarketChart';
  static const String nameGeckoMarketChartRange = 'MarketChartRange';
  static const String pathGeckoMarketChartRange =
      '$pathGeckoCoins/MarketChartRange';
  static const String nameGeckoMetadata = 'Metadata';
  static const String pathGeckoMetadata = '$pathGeckoCoins/Metadata';
  static const String nameGeckoOHLC = 'OHLC';
  static const String pathGeckoOHLC = '$pathGeckoCoins/OHLC';
  static const String nameGeckoMarketsList = 'MarketsList';
  static const String pathGeckoMarketsList = '$pathGeckoCoins/MarketsList';
}
