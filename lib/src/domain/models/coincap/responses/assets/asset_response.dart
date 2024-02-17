import 'package:equatable/equatable.dart';

import '../../../../../utils/constants/strings.dart';

/// The asset price is a volume-weighted average calculated by collecting ticker
/// data from exchanges.
///
/// Each exchange contributes to this price in relation to their volume,
/// meaning higher volume exchanges have more affect on this global price.
/// All values are translated into USD (United States Dollar) and can be
/// translated into other units of measurement through the /rates endpoint
class AssetResponse extends Equatable {
  /// unique identifier for asset
  final String? id;

  /// rank is in ascending order - this number is directly associated with the marketcap whereas the highest marketcap receives rank 1
  final int? rank;

  /// most common symbol used to identify this asset on an exchange
  final String? symbol;

  /// proper name for asset
  final String? name;

  /// available supply for trading
  final double? supply;

  /// total quantity of asset issued
  final double? maxSupply;

  /// supply x price
  final double? marketCapUsd;

  /// quantity of trading volume represented in USD over the last 24 hours
  final double? volumeUsd24Hr;

  /// volume-weighted price based on real-time market data, translated to USD
  final double? priceUsd;

  /// the direction and value change in the last 24 hours
  final double? changePercent24Hr;

  /// Volume Weighted Average Price in the last 24 hours
  final double? vwap24Hr;

  /// Coin website.
  final String? website;

  ///
  final int? timestamp;

  const AssetResponse({
    this.id,
    this.rank,
    this.symbol,
    this.name,
    this.supply,
    this.maxSupply,
    this.marketCapUsd,
    this.volumeUsd24Hr,
    this.priceUsd,
    this.changePercent24Hr,
    this.vwap24Hr,
    this.website,
    this.timestamp,
  });

  factory AssetResponse.fromMap(Map<String, dynamic> json) {
    Map<String, dynamic> data = json['data'] ?? json;
    return AssetResponse(
      id: data['id'],
      rank: int.tryParse(data['rank'] ?? kIntRevoker),
      symbol: data['symbol'],
      name: data['name'],
      supply: double.tryParse(data['supply'] ?? kDoubleRevoker),
      maxSupply: double.tryParse(data['maxSupply'] ?? kDoubleRevoker),
      marketCapUsd: double.tryParse(data['marketCapUsd'] ?? kDoubleRevoker),
      volumeUsd24Hr: double.tryParse(data['volumeUsd24Hr'] ?? kDoubleRevoker),
      priceUsd: double.tryParse(data['priceUsd'] ?? kDoubleRevoker),
      changePercent24Hr:
          double.tryParse(data['changePercent24Hr'] ?? kDoubleRevoker),
      vwap24Hr: double.tryParse(data['vwap24Hr'] ?? kDoubleRevoker),
      website: data['explorer'],
      timestamp: json['timestamp'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        rank,
        symbol,
        name,
        supply,
        maxSupply,
        marketCapUsd,
        volumeUsd24Hr,
        priceUsd,
        changePercent24Hr,
        vwap24Hr,
        website,
        timestamp,
      ];

  @override
  bool get stringify => true;
}
