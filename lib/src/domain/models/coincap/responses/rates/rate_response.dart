import 'package:equatable/equatable.dart';

import '../../../../../utils/constants/strings.dart';
import '../../currency_type.dart';

/// All prices on the CoinCap API are standardized in USD (United States Dollar).
/// To make translating to other values easy, CoinCap now offers a Rates endpoint.
/// We offer fiat and top cryptocurrency translated rates.
/// Fiat rates are available through OpenExchangeRates.org.
class RateResponse extends Equatable {
  const RateResponse({
    this.id,
    this.symbol,
    this.currencySymbol,
    this.type,
    this.rateUsd,
    this.timestamp,
  });

  /// unique identifier for asset or fiat
  final String? id;

  /// most common symbol used to identify asset or fiat
  final String? symbol;

  /// currency symbol used to identify asset or fiat
  final String? currencySymbol;

  /// type of currency - fiat or crypto
  final CurrencyType? type;

  /// rate conversion to USD
  final double? rateUsd;
  final int? timestamp;

  factory RateResponse.fromMap(Map<String, dynamic> mapData) {
    Map<String, dynamic> data = mapData['data'] ?? mapData;
    return RateResponse(
      id: data['id'],
      symbol: data['symbol'],
      currencySymbol: data['currencySymbol'],
      type: CurrencyType.fromMap(data['type']),
      rateUsd: double.tryParse(data['rateUsd'] ?? kDoubleRevoker),
      timestamp: mapData['timestamp'],
    );
  }

  @override
  List<Object?> get props => [id, symbol, currencySymbol, rateUsd, timestamp];

  @override
  bool get stringify => true;
}
