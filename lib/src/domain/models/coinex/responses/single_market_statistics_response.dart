import 'package:equatable/equatable.dart';

import '../../../../utils/constants/strings.dart';
import '../crypto.dart';

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
  const SingleMarketStatisticsResponse({
    this.cryptoDetail = CoinExCryptoDetail.unknown,
    this.serverTime,
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
      latestTransactionPrice: double.tryParse(map['last'] ?? kDoubleRevoker),
      buyPrice: double.tryParse(map['buy'] ?? kDoubleRevoker),
      buyAmount: double.tryParse(map['buy_amount'] ?? kDoubleRevoker),
      sellPrice: double.tryParse(map['sell'] ?? kDoubleRevoker),
      sellAmount: double.tryParse(map['sell_amount'] ?? kDoubleRevoker),
      openingPrice24H: double.tryParse(map['open'] ?? kDoubleRevoker),
      highestPrice24H: double.tryParse(map['high'] ?? kDoubleRevoker),
      lowestPrice24H: double.tryParse(map['low'] ?? kDoubleRevoker),
      volume24H: double.tryParse(map['vol'] ?? kDoubleRevoker),
    );
  }

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

  @override
  bool? get stringify => true;
}
