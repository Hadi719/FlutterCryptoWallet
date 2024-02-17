import 'package:equatable/equatable.dart';

import 'rate_response.dart';

/// All prices on the CoinCap API are standardized in USD (United States Dollar).
/// To make translating to other values easy, CoinCap now offers a Rates endpoint.
/// We offer fiat and top cryptocurrency translated rates.
/// Fiat rates are available through OpenExchangeRates.org.
class RatesListResponse extends Equatable {
  final List<RateResponse> ratesList;

  final int? timestamp;

  const RatesListResponse({
    this.ratesList = const [],
    this.timestamp,
  });

  factory RatesListResponse.fromMap(Map<String, dynamic> mapData) {
    return RatesListResponse(
      ratesList: List.from(mapData['data'])
          .map((e) => RateResponse.fromMap(e))
          .toList(),
      timestamp: mapData['timestamp'],
    );
  }

  @override
  List<Object?> get props => [ratesList, timestamp];

  @override
  bool get stringify => true;
}
