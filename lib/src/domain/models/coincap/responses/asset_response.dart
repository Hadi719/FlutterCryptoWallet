import 'package:equatable/equatable.dart';

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
  final String? rank;

  /// most common symbol used to identify this asset on an exchange
  final String? symbol;

  /// proper name for asset
  final String? name;

  /// available supply for trading
  final String? supply;

  /// total quantity of asset issued
  final String? maxSupply;

  /// supply x price
  final String? marketCapUsd;

  /// quantity of trading volume represented in USD over the last 24 hours
  final String? volumeUsd24Hr;

  /// volume-weighted price based on real-time market data, translated to USD
  final String? priceUsd;

  /// the direction and value change in the last 24 hours
  final String? changePercent24Hr;

  /// Volume Weighted Average Price in the last 24 hours
  final String? vwap24Hr;

  ///
  final String? explorer;

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
    this.explorer,
    this.timestamp,
  });

  factory AssetResponse.fromMap(Map<String, dynamic> json) {
    return AssetResponse(
      id: json['id'],
      rank: json['rank'],
      symbol: json['symbol'],
      name: json['name'],
      supply: json['supply'],
      maxSupply: json['maxSupply'],
      marketCapUsd: json['marketCapUsd'],
      volumeUsd24Hr: json['volumeUsd24Hr'],
      priceUsd: json['priceUsd'],
      changePercent24Hr: json['changePercent24Hr'],
      vwap24Hr: json['vwap24Hr'],
      explorer: json['explorer'],
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
        explorer,
        timestamp,
      ];

  @override
  bool get stringify => true;
}
