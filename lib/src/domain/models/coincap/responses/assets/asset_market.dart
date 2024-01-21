import 'package:equatable/equatable.dart';

import '../../../../../utils/constants/strings.dart';

class AssetMarket extends Equatable {
  const AssetMarket({
    this.exchangeId,
    this.baseId,
    this.quoteId,
    this.baseSymbol,
    this.quoteSymbol,
    this.volumeUsd24Hr,
    this.priceUsd,
    this.volumePercent,
  });

  /// unique identifier for exchange
  final String? exchangeId;

  /// unique identifier for this asset, base is asset purchased
  final String? baseId;

  /// unique identifier for this asset, quote is asset used to purchase based
  final String? quoteId;

  /// most common symbol used to identify asset, base is asset purchased
  final String? baseSymbol;

  /// most common symbol used to identify asset, quote is asset used to purchase base
  final String? quoteSymbol;

  /// volume transacted on this market in last 24 hours
  final double? volumeUsd24Hr;

  /// the amount of quote asset traded for one unit of base asset
  final double? priceUsd;

  /// percent of quote asset volume
  final double? volumePercent;

  factory AssetMarket.fromMap(Map<String, dynamic> mapData) {
    return AssetMarket(
      exchangeId: mapData['exchangeId'],
      baseId: mapData['baseId'],
      quoteId: mapData['quoteId'],
      baseSymbol: mapData['baseSymbol'],
      quoteSymbol: mapData['quoteSymbol'],
      volumeUsd24Hr:
          double.tryParse(mapData['volumeUsd24Hr'] ?? kDoubleRevoker),
      priceUsd: double.tryParse(mapData['priceUsd'] ?? kDoubleRevoker),
      volumePercent:
          double.tryParse(mapData['volumePercent'] ?? kDoubleRevoker),
    );
  }

  @override
  List<Object?> get props => [
        exchangeId,
        baseId,
        quoteId,
        baseSymbol,
        quoteSymbol,
        volumeUsd24Hr,
        priceUsd,
        volumePercent,
      ];

  @override
  bool get stringify => true;
}
