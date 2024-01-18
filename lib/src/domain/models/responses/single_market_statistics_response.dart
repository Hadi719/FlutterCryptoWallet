import 'package:equatable/equatable.dart';

import '../coinex/crypto.dart';

/// {@template SingleMarketStatistics}
///
/// Statistics on a single market.
///
/// * Signature required: No
///
/// {@endtemplate}
class SingleMarketStatisticsResponse extends Equatable {
  final CoinExCryptoDetail cryptoDetail;
  final DateTime? serverTime;
  final double latestTransactionPrice;
  final double buyPrice;
  final double buyAmount;
  final double sellPrice;
  final double sellAmount;
  final double openingPrice24H;
  final double highestPrice24H;
  final double lowestPrice24H;
  final double volume24H;

  /// {@macro SingleMarketStatistics}
  const SingleMarketStatisticsResponse({
    this.cryptoDetail = CoinExCryptoDetail.unknown,
    this.serverTime,
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

  /// {@macro SingleMarketStatistics}
  factory SingleMarketStatisticsResponse.fromMap(
      Map<String, dynamic> map, String marketName) {
    Map<String, dynamic> data = map['data']['ticker'];
    int? time = map['data']['date'];

    return SingleMarketStatisticsResponse(
      cryptoDetail: CoinExCryptoDetail.fromMarketName(marketName),
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

  /// {@macro SingleMarketStatistics}
  factory SingleMarketStatisticsResponse.fromAllMarket(
    Map<String, dynamic> map, {
    required CoinExCryptoDetail cryptoDetail,
    int? time,
  }) {
    return SingleMarketStatisticsResponse(
      cryptoDetail: cryptoDetail,
      serverTime: time != null
          ? DateTime.fromMillisecondsSinceEpoch(time)
          : DateTime.now(),
      latestTransactionPrice: double.tryParse(map['last']) ?? 0.0,
      buyPrice: double.tryParse(map['buy']) ?? 0.0,
      buyAmount: double.tryParse(map['buy_amount']) ?? 0.0,
      sellPrice: double.tryParse(map['sell']) ?? 0.0,
      sellAmount: double.tryParse(map['sell_amount']) ?? 0.0,
      openingPrice24H: double.tryParse(map['open']) ?? 0.0,
      highestPrice24H: double.tryParse(map['high']) ?? 0.0,
      lowestPrice24H: double.tryParse(map['low']) ?? 0.0,
      volume24H: double.tryParse(map['vol']) ?? 0.0,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        cryptoDetail,
        serverTime,
        latestTransactionPrice,
        buyPrice,
        buyAmount,
        sellPrice,
        sellAmount,
        openingPrice24H,
        highestPrice24H,
        lowestPrice24H,
        volume24H,
      ];
}
