import 'package:equatable/equatable.dart';

import 'asset_history.dart';

/// volume-weighted price based on real-time market data, translated to USD
class AssetHistoryResponse extends Equatable {
  const AssetHistoryResponse({
    this.pricesList = const [],
    this.timestamp,
  });
  final List<AssetHistory> pricesList;

  final int? timestamp;

  factory AssetHistoryResponse.fromMap(Map<String, dynamic> mapData) {
    return AssetHistoryResponse(
      pricesList: List.from(mapData['data'])
          .map((e) => AssetHistory.fromMap(e))
          .toList(),
      timestamp: mapData['timestamp'],
    );
  }

  @override
  List<Object?> get props => [pricesList, timestamp];

  @override
  bool get stringify => true;
}
