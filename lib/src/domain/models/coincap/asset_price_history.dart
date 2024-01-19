import 'package:equatable/equatable.dart';

/// volume-weighted price based on real-time market data, translated to USD
class AssetPriceHistory extends Equatable {
  const AssetPriceHistory({
    this.priceUsd,
    this.time,
  });

  /// volume-weighted price based on real-time market data, translated to USD
  final double? priceUsd;

  ///  timestamp in UNIX in milliseconds
  final int? time;

  factory AssetPriceHistory.fromMap(Map<String, dynamic> mapData) {
    return AssetPriceHistory(
      priceUsd: double.tryParse(mapData['priceUsd'] ?? '0.0'),
      time: int.tryParse(mapData['time'] ?? '0'),
    );
  }

  @override
  List<Object?> get props => [priceUsd, time];

  @override
  bool get stringify => true;
}
