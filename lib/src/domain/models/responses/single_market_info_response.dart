import 'package:equatable/equatable.dart';

import '../coinex/crypto.dart';

/// {@template SingleMarketInfoResponse}
///
/// Gets detailed information on a single market
///
/// * Signature required: No
///
/// {@endtemplate}
class SingleMarketInfoResponse extends Equatable {
  final CryptoDetail cryptoDetail;
  final double minAmount;
  final double takerFeeRate;
  final double makerFeeRate;
  final int tradingDecimal;
  final int pricingDecimal;

  /// {@macro SingleMarketInfoResponse}
  const SingleMarketInfoResponse({
    required this.cryptoDetail,
    required this.minAmount,
    required this.takerFeeRate,
    required this.makerFeeRate,
    required this.tradingDecimal,
    required this.pricingDecimal,
  });

  /// {@macro SingleMarketInfoResponse}
  factory SingleMarketInfoResponse.fromMap(Map<String, dynamic> map) {
    var mapData = map['data'] ?? map;
    return SingleMarketInfoResponse(
        cryptoDetail: CryptoDetail.fromMarketName(mapData['name']),
        minAmount: double.tryParse(mapData['min_amount']) ?? 0.0,
        takerFeeRate: double.tryParse(mapData['taker_fee_rate']) ?? 0.0,
        makerFeeRate: double.tryParse(mapData['maker_fee_rate']) ?? 0.0,
        tradingDecimal: mapData['trading_decimal'] ?? 0,
        pricingDecimal: mapData['pricing_decimal'] ?? 0);
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        cryptoDetail,
        minAmount,
        takerFeeRate,
        makerFeeRate,
        tradingDecimal,
        pricingDecimal,
      ];
}
