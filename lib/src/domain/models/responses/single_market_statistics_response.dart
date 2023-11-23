import 'package:equatable/equatable.dart';

/// {@template SingleMarketStatistics}
///
/// Statistics on a single market.
///
/// * Signature required: No
///
/// {@endtemplate}
class SingleMarketStatisticsResponse extends Equatable {
  // final CryptoDetail cryptoDetail;
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
    // this.cryptoDetail = CryptoDetail.unknown,
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
  factory SingleMarketStatisticsResponse.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> data = map['data']['ticker'];
    int? time = map['data']['date'];

    /// Todo: its not have the [CryptoDetail], do something about it.
    return SingleMarketStatisticsResponse(
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

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
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
