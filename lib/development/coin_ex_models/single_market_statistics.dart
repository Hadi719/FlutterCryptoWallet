import '../../src/domain/models/coinex/crypto.dart';

/// {@template SingleMarketStatistics}
///
/// Statistics on a single market.
///
/// * Signature required: No
///
/// {@endtemplate}
class SingleMarketStatistics {
  /// {@macro SingleMarketStatistics}
  const SingleMarketStatistics({
    this.cryptoDetail = CoinExCryptoDetail.unknown,
    required this.serverTime,
    required this.latestTransactionPrice,
    required this.buyPrice,
    required this.buyAmount,
    required this.sellPrice,
    required this.sellAmount,
    required this.openingPrice24H,
    required this.highestPrice24H,
    required this.lowestPrice24H,
    required this.volume24H,
  });

  static const urlPath = '/market/ticker';

  final CoinExCryptoDetail cryptoDetail;
  final DateTime serverTime;
  final double latestTransactionPrice;
  final double buyPrice;
  final double buyAmount;
  final double sellPrice;
  final double sellAmount;
  final double openingPrice24H;
  final double highestPrice24H;
  final double lowestPrice24H;
  final double volume24H;

  factory SingleMarketStatistics.fromJson(
    Map<String, dynamic> jsonData, {
    CoinExCryptoDetail cryptoDetail = CoinExCryptoDetail.unknown,
  }) {
    Map<String, dynamic> data = jsonData['ticker'];
    int? time = jsonData['date'];

    return SingleMarketStatistics(
      cryptoDetail: cryptoDetail,
      serverTime: time != null
          ? DateTime.fromMillisecondsSinceEpoch(time)
          : DateTime.now(),
      latestTransactionPrice: double.tryParse(data['last']) ?? 0.0,
      buyPrice: double.tryParse(data['buy']) ?? 0.0,
      buyAmount: double.tryParse(data['buy_amount']) ?? 0.0,
      sellPrice: double.tryParse(data['sell']) ?? 0.0,
      sellAmount: double.tryParse(data['sell_amount']) ?? 0.0,
      openingPrice24H: double.tryParse(data['open']) ?? 0.0,
      highestPrice24H: double.tryParse(data['high']) ?? 0.0,
      lowestPrice24H: double.tryParse(data['low']) ?? 0.0,
      volume24H: double.tryParse(data['vol']) ?? 0.0,
    );
  }
  factory SingleMarketStatistics.fromAllMarket(
    Map<String, dynamic> jsonData, {
    CoinExCryptoDetail? cryptoDetail,
    int? time,
  }) {
    return SingleMarketStatistics(
      cryptoDetail: cryptoDetail ?? CoinExCryptoDetail.unknown,
      serverTime: time != null
          ? DateTime.fromMillisecondsSinceEpoch(time)
          : DateTime.now(),
      latestTransactionPrice: double.tryParse(jsonData['last']) ?? 0.0,
      buyPrice: double.tryParse(jsonData['buy']) ?? 0.0,
      buyAmount: double.tryParse(jsonData['buy_amount']) ?? 0.0,
      sellPrice: double.tryParse(jsonData['sell']) ?? 0.0,
      sellAmount: double.tryParse(jsonData['sell_amount']) ?? 0.0,
      openingPrice24H: double.tryParse(jsonData['open']) ?? 0.0,
      highestPrice24H: double.tryParse(jsonData['high']) ?? 0.0,
      lowestPrice24H: double.tryParse(jsonData['low']) ?? 0.0,
      volume24H: double.tryParse(jsonData['vol']) ?? 0.0,
    );
  }

  @override
  String toString() {
    return '\n\n=======   $this   =======\n'
        'Crypto: ${cryptoDetail.name} \n'
        'serverTime: $serverTime \n'
        'latest Transaction Price: $latestTransactionPrice\n'
        'buy1 Price: $buyPrice\n'
        'buy1 Amount: $buyAmount\n'
        'sell1 Price: $sellPrice\n'
        'sell1 Amount: $sellAmount\n'
        '24H Opening Price: $openingPrice24H\n'
        '24H Highest Price: $highestPrice24H\n'
        '24H Lowest Price: $lowestPrice24H\n'
        '24H Volume: $volume24H\n'
        '=============================';
  }
}
