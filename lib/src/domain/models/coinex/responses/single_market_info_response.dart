import 'package:equatable/equatable.dart';

import '../../../../config/utils/constants/strings.dart';
import '../crypto.dart';

/// {@template SingleMarketInfoResponse}
///
/// Gets detailed information on a single market
///
/// * Signature required: No
///
/// {@endtemplate}
class SingleMarketInfoResponse extends Equatable {
  final CoinExCryptoDetail cryptoDetail;
  final double? minAmount;
  final double? takerFeeRate;
  final double? makerFeeRate;
  final int tradingDecimal;
  final int pricingDecimal;

  /// {@macro SingleMarketInfoResponse}
  const SingleMarketInfoResponse({
    required this.cryptoDetail,
    this.minAmount,
    this.takerFeeRate,
    this.makerFeeRate,
    required this.tradingDecimal,
    required this.pricingDecimal,
  });

  /// {@macro SingleMarketInfoResponse}
  factory SingleMarketInfoResponse.fromMap(Map<String, dynamic> map) {
    var mapData = map['data'] ?? map;
    return SingleMarketInfoResponse(
        cryptoDetail: CoinExCryptoDetail.fromMarketName(mapData['name']),
        minAmount: double.tryParse(mapData['min_amount'] ?? kDoubleRevoker),
        takerFeeRate:
            double.tryParse(mapData['taker_fee_rate'] ?? kDoubleRevoker),
        makerFeeRate:
            double.tryParse(mapData['maker_fee_rate'] ?? kDoubleRevoker),
        tradingDecimal: mapData['trading_decimal'] ?? 0,
        pricingDecimal: mapData['pricing_decimal'] ?? 0);
  }

  @override
  List<Object?> get props => [
        cryptoDetail,
        minAmount,
        takerFeeRate,
        makerFeeRate,
        tradingDecimal,
        pricingDecimal,
      ];

  @override
  bool? get stringify => true;
}
