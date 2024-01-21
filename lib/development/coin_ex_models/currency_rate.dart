import '../../src/utils/constants/strings.dart';

/// {@template CurrencyRate}
///
/// The exchange rate of all cryptocurrencies to USD
///
/// * Signature required: No
///
/// {@endtemplate}
class CurrencyRate {
  /// {@macro CurrencyRate}
  static const String urlPath = '/common/currency/rate';

  CurrencyRate({
    this.crUSDT,
    this.crUSDC,
    this.crBTC,
    this.crBCH,
    this.crETH,
    this.crCET,
  });

  double? crUSDT;
  double? crUSDC;
  double? crBTC;
  double? crBCH;
  double? crETH;
  double? crCET;

  factory CurrencyRate.fromJson(Map<String, dynamic> jsonData) {
    return CurrencyRate(
      crUSDT: double.tryParse(jsonData['USDT_to_USD'] ?? kDoubleRevoker),
      crUSDC: double.tryParse(jsonData['USDC_to_USD'] ?? kDoubleRevoker),
      crBTC: double.tryParse(jsonData['BTC_to_USD'] ?? kDoubleRevoker),
      crBCH: double.tryParse(jsonData['BCH_to_USD'] ?? kDoubleRevoker),
      crETH: double.tryParse(jsonData['ETH_to_USD'] ?? kDoubleRevoker),
      crCET: double.tryParse(jsonData['CET_to_USD'] ?? kDoubleRevoker),
    );
  }

  @override
  String toString() {
    return '\n\n=======   $this   =======\n'
        'USDT currency rate to USD: $crUSDT\n'
        'USDC currency rate to USD: $crUSDC\n'
        'BTC currency rate to USD: $crBTC\n'
        'BCH currency rate to USD: $crBCH\n'
        'ETH currency rate to USD: $crETH\n'
        'CET currency rate to USD: $crCET\n';
  }
}
