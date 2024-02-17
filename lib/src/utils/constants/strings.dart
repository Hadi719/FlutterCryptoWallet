// App
const String kAppTitle = 'Flutter Crypto Wallet';

// const String kCoinGeckoPath = '';

// -- CoinCap
const String kCoinCapBaseUrl = 'https://api.coincap.io/v2';
const String kCoinCapPathAsset = '/assets/{id}';
const String kCoinCapPathAssetHistory = '/assets/{id}/history';
const String kCoinCapPathAssetMarkets = '/assets/{id}/markets';
const String kCoinCapPathAssetsList = '/assets';
const String kCoinCapPathCandlesList = '/candles';
const String kCoinCapPathExchange = '/exchanges/{id}';
const String kCoinCapPathExchangesList = '/exchanges';
const String kCoinCapPathMarketsList = '/markets';
const String kCoinCapPathRate = '/rates/{id}';
const String kCoinCapPathRatesList = '/rates';
// -- CoinEX
const String kCoinExBaseUrl = 'https://api.coinex.com/v1';
const String kCoinExPathAllMarketInfo = '/market/info';
const String kCoinExPathAllMarketList = '/market/list';
const String kCoinExPathAllMarketStatistics = '/market/ticker/all';
const String kCoinExPathCurrencyRate = '/common/currency/rate';
const String kCoinExPathKLineData = '/market/kline';
const String kCoinExPathLatestTransactionData = '/market/deals';
const String kCoinExPathMarketDepth = '/market/depth';
const String kCoinExPathSingleMarketInfo = '/market/detail';
const String kCoinExPathSingleMarketStatistics = '/market/ticker';
// Networking & APIs

// -- CoinGecko
const String kCoinGeckoBaseUrl = 'https://api.coingecko.com/api/v3';
const String kCoinGeckoPathAssetPlatformsList = '/asset_platforms';
const String kCoinGeckoPathCoinHistory = '/coins/{id}/history';

const String kCoinGeckoPathCoinMarketChart = '/coins/{id}/market_chart';
const String kCoinGeckoPathCoinMarketChartRange =
    '/coins/{id}/market_chart/range';
const String kCoinGeckoPathCoinMetaData = '/coins/{id}';
const String kCoinGeckoPathCoinOHLC = '/coins/{id}/ohlc';
const String kCoinGeckoPathCoinsList = '/coins/list';
const String kCoinGeckoPathCoinsMarketsList = '/coins/markets';
const String kCoinGeckoPathCoinTickers = '/coins/{id}/tickers';
const String kCoinGeckoPathExchangeRates = '/exchange_rates';
const String kCoinGeckoPathSimplePricesList = '/simple/price';
const String kCoinGeckoPathSimpleSupportedVsCurrencies =
    '/simple/supported_vs_currencies';

/// Making [double.tryParse()] returns null instead of an error;
///
/// ```dart
/// double.tryParse(map['maxSupply'] ?? kDoubleRevoker);
/// ```
const String kDoubleRevoker = '0xFF';
const String kIconPathADA = '${kIconsDirPath}ADA.png';
const String kIconPathBNB = '${kIconsDirPath}BNB.png';
const String kIconPathBTC = '${kIconsDirPath}BTC.png';
const String kIconPathDOGE = '${kIconsDirPath}DOGE.png';
const String kIconPathDOT = '${kIconsDirPath}DOT.png';
const String kIconPathETH = '${kIconsDirPath}ETH.png';
const String kIconPathSOL = '${kIconsDirPath}SOL.png';
const String kIconPathUSDC = '${kIconsDirPath}USDC.png';
const String kIconPathUSDT = '${kIconsDirPath}USDT.png';
const String kIconPathXRP = '${kIconsDirPath}XRP.png';

// Storage and Databases

// Utils
// Assets - Icons
const String kIconsDirPath = 'assets/images/icons/crypto_icons/';

/// Making [int.tryParse()] returns null instead of an error;
///
/// ```dart
/// int.tryParse(map['maxSupply'] ?? kIntRevoker);
/// ```
const String kIntRevoker = '1f';
