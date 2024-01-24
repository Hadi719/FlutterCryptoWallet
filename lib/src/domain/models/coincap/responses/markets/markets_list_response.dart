import 'package:equatable/equatable.dart';

import 'market_response.dart';

/// Take a closer look into exchanges with the /markets endpoint.
/// Similar to the /exchanges endpoint, we strive to offer transparency into
/// how real-time our data is with a key identifying when the market was last updated.
/// For a historical view on how a market has performed, see the /candles endpoint.
/// All market data represents actual trades processed,
/// orders on an exchange are not represented.
/// Data received from individual markets is used to calculate the current price of an asset.
class MarketsListResponse extends Equatable {
  const MarketsListResponse({
    this.marketsList = const [],
    this.timestamp,
  });

  final List<MarketResponse> marketsList;
  final int? timestamp;

  factory MarketsListResponse.fromMap(Map<String, dynamic> mapData) {
    return MarketsListResponse(
      marketsList: List.from(mapData['data'])
          .map((e) => MarketResponse.fromMap(e))
          .toList(),
      timestamp: mapData['timestamp'],
    );
  }

  @override
  List<Object?> get props => [marketsList, timestamp];

  @override
  bool get stringify => true;
}
