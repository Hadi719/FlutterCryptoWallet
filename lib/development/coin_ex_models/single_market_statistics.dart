import '../../src/domain/models/coinex/crypto.dart';
import '../../src/utils/constants/strings.dart';

/// {@template SingleMarketStatistics}
///
/// Statistics on a single market.
///
/// * Signature required: No
///
/// {@endtemplate}
class SingleMarketStatistics {
  static const urlPath = '/market/ticker';

  final CoinExCryptoDetail cryptoDetail;

  final DateTime serverTime;
  final double? latestTransactionPrice;
  final double? buyPrice;
  final double? buyAmount;
  final double? sellPrice;
  final double? sellAmount;
  final double? openingPrice24H;
  final double? highestPrice24H;
  final double? lowestPrice24H;
  final double? volume24H;

  /// {@macro SingleMarketStatistics}
  const SingleMarketStatistics({
    this.cryptoDetail = CoinExCryptoDetail.unknown,
    required this.serverTime,
    this.latestTransactionPrice,
    this.buyPrice,
    this.buyAmount,
    this.sellPrice,
    this.sellAmount,
    this.openingPrice24H,
    this.highestPrice24H,
    this.lowestPrice24H,
    this.volume24H,
  });

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
      latestTransactionPrice:
          double.tryParse(jsonData['last'] ?? kDoubleRevoker),
      buyPrice: double.tryParse(jsonData['buy'] ?? kDoubleRevoker),
      buyAmount: double.tryParse(jsonData['buy_amount'] ?? kDoubleRevoker),
      sellPrice: double.tryParse(jsonData['sell'] ?? kDoubleRevoker),
      sellAmount: double.tryParse(jsonData['sell_amount'] ?? kDoubleRevoker),
      openingPrice24H: double.tryParse(jsonData['open'] ?? kDoubleRevoker),
      highestPrice24H: double.tryParse(jsonData['high'] ?? kDoubleRevoker),
      lowestPrice24H: double.tryParse(jsonData['low'] ?? kDoubleRevoker),
      volume24H: double.tryParse(jsonData['vol'] ?? kDoubleRevoker),
    );
  }

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
      latestTransactionPrice: double.tryParse(data['last'] ?? kDoubleRevoker),
      buyPrice: double.tryParse(data['buy'] ?? kDoubleRevoker),
      buyAmount: double.tryParse(data['buy_amount'] ?? kDoubleRevoker),
      sellPrice: double.tryParse(data['sell'] ?? kDoubleRevoker),
      sellAmount: double.tryParse(data['sell_amount'] ?? kDoubleRevoker),
      openingPrice24H: double.tryParse(data['open'] ?? kDoubleRevoker),
      highestPrice24H: double.tryParse(data['high'] ?? kDoubleRevoker),
      lowestPrice24H: double.tryParse(data['low'] ?? kDoubleRevoker),
      volume24H: double.tryParse(data['vol'] ?? kDoubleRevoker),
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
