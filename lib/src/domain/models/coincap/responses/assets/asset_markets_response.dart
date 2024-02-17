import 'package:equatable/equatable.dart';

import 'asset_market.dart';

class AssetMarketsResponse extends Equatable {
  final List<AssetMarket>? marketsList;

  final int? timestamp;

  const AssetMarketsResponse({
    this.marketsList = const [],
    this.timestamp,
  });

  factory AssetMarketsResponse.fromMap(Map<String, dynamic> mapData) {
    return AssetMarketsResponse(
      marketsList: List.from(mapData['data'])
          .map((e) => AssetMarket.fromMap(e))
          .toList(),
      timestamp: mapData['timestamp'],
    );
  }

  @override
  List<Object?> get props => [marketsList, timestamp];

  @override
  bool get stringify => true;
}
