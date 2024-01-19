import 'package:equatable/equatable.dart';

import 'asset_history.dart';

/// volume-weighted price based on real-time market data, translated to USD
class AssetHistoryResponse extends Equatable {
  const AssetHistoryResponse({
    this.historiesList = const [],
    this.timestamp,
  });
  final List<AssetHistory> historiesList;

  final int? timestamp;

  factory AssetHistoryResponse.fromMap(Map<String, dynamic> mapData) {
    return AssetHistoryResponse(
      historiesList: List.from(mapData['data'])
          .map((e) => AssetHistory.fromMap(e))
          .toList(),
      timestamp: mapData['timestamp'],
    );
  }

  @override
  List<Object?> get props => [historiesList, timestamp];

  @override
  bool get stringify => true;
}
