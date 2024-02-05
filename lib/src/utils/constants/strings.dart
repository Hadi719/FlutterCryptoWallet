// App
const String kAppTitle = 'Flutter Crypto Wallet';

// Networking & APIs

// -- CoinGecko
const String kCoinGeckoBaseUrl = 'https://api.coingecko.com/api/v3';
const String kCoinGeckoPathSimplePricesList = '/simple/price';
const String kCoinGeckoPathSimpleSupportedVsCurrencies =
    '/simple/supported_vs_currencies';
const String kCoinGeckoPathCoinsList = '/coins/list';
const String kCoinGeckoPathCoinsMarketsList = '/coins/markets';
const String kCoinGeckoPathCoinMetaData = '/coins/{id}';
const String kCoinGeckoPathCoinTickers = '/coins/{id}/tickers';
const String kCoinGeckoPathCoinHistory = '/coins/{id}/history';
const String kCoinGeckoPathCoinMarketChart = '/coins/{id}/market_chart';
const String kCoinGeckoPathCoinMarketChartRange =
    '/coins/{id}/market_chart/range';
const String kCoinGeckoPathCoinOHLC = '/coins/{id}/ohlc';
const String kCoinGeckoPathAssetPlatformsList = '/asset_platforms';
const String kCoinGeckoPathCategoriesList = '/coins/categories/list';
const String kCoinGeckoPathCategoriesListWithMarketData = '/coins/categories';
// const String kCoinGeckoPath = '';

// -- CoinCap
const String kCoinCapBaseUrl = 'https://api.coincap.io/v2';
const String kCoinCapPathAssetsList = '/assets';
const String kCoinCapPathAsset = '/assets/{id}';
const String kCoinCapPathAssetHistory = '/assets/{id}/history';
const String kCoinCapPathAssetMarkets = '/assets/{id}/markets';
const String kCoinCapPathRatesList = '/rates';
const String kCoinCapPathRate = '/rates/{id}';
const String kCoinCapPathExchangesList = '/exchanges';
const String kCoinCapPathExchange = '/exchanges/{id}';
const String kCoinCapPathMarketsList = '/markets';
const String kCoinCapPathCandlesList = '/candles';

// -- CoinEX
const String kCoinExBaseUrl = 'https://api.coinex.com/v1';
const String kCoinExPathAllMarketList = '/market/list';
const String kCoinExPathAllMarketInfo = '/market/info';
const String kCoinExPathSingleMarketInfo = '/market/detail';
const String kCoinExPathMarketDepth = '/market/depth';
const String kCoinExPathLatestTransactionData = '/market/deals';
const String kCoinExPathKLineData = '/market/kline';
const String kCoinExPathSingleMarketStatistics = '/market/ticker';
const String kCoinExPathAllMarketStatistics = '/market/ticker/all';
const String kCoinExPathCurrencyRate = '/common/currency/rate';

// Assets - Icons
const String kIconsDirPath = 'assets/images/icons/crypto_icons/';
const String kIconPathBTC = '${kIconsDirPath}BTC.png';
const String kIconPathETH = '${kIconsDirPath}ETH.png';
const String kIconPathBNB = '${kIconsDirPath}BNB.png';
const String kIconPathUSDT = '${kIconsDirPath}USDT.png';
const String kIconPathUSDC = '${kIconsDirPath}USDC.png';
const String kIconPathXRP = '${kIconsDirPath}XRP.png';
const String kIconPathADA = '${kIconsDirPath}ADA.png';
const String kIconPathSOL = '${kIconsDirPath}SOL.png';
const String kIconPathDOT = '${kIconsDirPath}DOT.png';
const String kIconPathDOGE = '${kIconsDirPath}DOGE.png';

// Storage and Databases

// Utils
/// Making [double.tryParse()] returns null instead of an error;
///
/// ```dart
/// double.tryParse(map['maxSupply'] ?? kDoubleRevoker);
/// ```
const String kDoubleRevoker = '0xFF';

/// Making [int.tryParse()] returns null instead of an error;
///
/// ```dart
/// double.tryParse(map['maxSupply'] ?? kIntRevoker);
/// ```
const String kIntRevoker = '1f';
