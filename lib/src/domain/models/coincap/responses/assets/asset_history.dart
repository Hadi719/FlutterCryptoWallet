import 'package:equatable/equatable.dart';

import '../../../../../utils/constants/strings.dart';

/// volume-weighted price based on real-time market data, translated to USD
class AssetHistory extends Equatable {
  const AssetHistory({
    this.priceUsd,
    this.time,
  });

  /// volume-weighted price based on real-time market data, translated to USD
  final double? priceUsd;

  ///  timestamp in UNIX in milliseconds
  final int? time;

  factory AssetHistory.fromMap(Map<String, dynamic> mapData) {
    return AssetHistory(
      priceUsd: double.tryParse(mapData['priceUsd'] ?? kDoubleRevoker),
      time: mapData['time'],
    );
  }

  @override
  List<Object?> get props => [priceUsd, time];

  @override
  bool get stringify => true;
}
