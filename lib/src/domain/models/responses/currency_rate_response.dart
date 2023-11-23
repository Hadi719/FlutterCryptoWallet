// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

/// {@template CurrencyRate}
///
/// The exchange rate of all cryptocurrencies to USD.
///
/// * Signature required: No
///
/// {@endtemplate}
class CurrencyRateResponse extends Equatable {
  final double? USDT;
  final double? USDC;
  final double? BTC;
  final double? BCH;
  final double? ETH;
  final double? CET;

  /// {@macro CurrencyRate}
  const CurrencyRateResponse({
    this.USDT,
    this.USDC,
    this.BTC,
    this.BCH,
    this.ETH,
    this.CET,
  });

  /// {@macro CurrencyRate}
  factory CurrencyRateResponse.fromMap(Map<String, dynamic> map) {
    return CurrencyRateResponse(
      USDT: double.tryParse(map['data']['USDT_to_USD']),
      USDC: double.tryParse(map['data']['USDC_to_USD']),
      BTC: double.tryParse(map['data']['BTC_to_USD']),
      BCH: double.tryParse(map['data']['BCH_to_USD']),
      ETH: double.tryParse(map['data']['ETH_to_USD']),
      CET: double.tryParse(map['data']['CET_to_USD']),
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        USDT,
        USDC,
        BTC,
        BCH,
        ETH,
        CET,
      ];
}
