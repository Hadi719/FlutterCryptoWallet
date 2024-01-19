import 'package:equatable/equatable.dart';

import '../asset_price_history.dart';

/// volume-weighted price based on real-time market data, translated to USD
class AssetHistoryResponse extends Equatable {
  const AssetHistoryResponse({
    this.pricesList = const [],
    this.timestamp,
  });
  final List<AssetPriceHistory> pricesList;

  final int? timestamp;

  factory AssetHistoryResponse.fromMap(Map<String, dynamic> mapData) {
    return AssetHistoryResponse(
      pricesList: List.from(mapData['data'])
          .map((e) => AssetPriceHistory.fromMap(e))
          .toList(),
      timestamp: int.tryParse(mapData['timestamp'] ?? '0'),
    );
  }

  @override
  List<Object?> get props => [pricesList, timestamp];

  @override
  bool get stringify => true;
}
