import 'package:equatable/equatable.dart';

import 'asset_history.dart';

/// volume-weighted price based on real-time market data, translated to USD
class AssetHistoriesResponse extends Equatable {
  final List<AssetHistory> historiesList;

  final int? timestamp;

  const AssetHistoriesResponse({
    this.historiesList = const [],
    this.timestamp,
  });

  factory AssetHistoriesResponse.fromMap(Map<String, dynamic> mapData) {
    return AssetHistoriesResponse(
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
