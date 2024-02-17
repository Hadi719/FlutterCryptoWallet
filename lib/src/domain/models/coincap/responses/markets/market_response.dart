import 'package:equatable/equatable.dart';

import '../../../../../utils/constants/strings.dart';

class MarketResponse extends Equatable {
  /// unique identifier for exchange
  final String? exchangeId;

  /// rank is in ascending order - this number represents the amount of volume transacted by this market in relation to other markets on that exchange
  final int? rank;

  /// most common symbol used to identify asset, base is asset purchased
  final String? baseSymbol;

  /// unique identifier for this asset, base is asset purchased
  final String? baseId;

  /// most common symbol used to identify asset, quote is asset used to purchase base
  final String? quoteSymbol;

  /// unique identifier for this asset, quote is asset used to purchase base
  final String? quoteId;

  /// the amount of quote asset traded for one unit of base asset
  final double? priceQuote;

  /// quote price translated to USD
  final double? priceUsd;

  /// volume transacted on this market in last 24 hours
  final double? volumeUsd24Hr;

  /// the amount of daily volume a single market transacts in relation to total daily volume of all markets on the exchange
  final double? percentExchangeVolume;

  /// number of trades on this market in the last 24 hours
  final int? tradesCount24Hr;

  /// UNIX timestamp (milliseconds) since information was received from this particular market
  final int? updated;

  const MarketResponse({
    this.exchangeId,
    this.rank,
    this.baseSymbol,
    this.baseId,
    this.quoteSymbol,
    this.quoteId,
    this.priceQuote,
    this.priceUsd,
    this.volumeUsd24Hr,
    this.percentExchangeVolume,
    this.tradesCount24Hr,
    this.updated,
  });

  factory MarketResponse.fromMap(Map<String, dynamic> mapData) {
    return MarketResponse(
      exchangeId: mapData['exchangeId'],
      rank: int.tryParse(mapData['rank'] ?? kIntRevoker),
      baseSymbol: mapData['baseSymbol'],
      baseId: mapData['baseId'],
      quoteSymbol: mapData['quoteSymbol'],
      quoteId: mapData['quoteId'],
      priceQuote: double.tryParse(mapData['priceQuote'] ?? kDoubleRevoker),
      priceUsd: double.tryParse(mapData['priceUsd'] ?? kDoubleRevoker),
      volumeUsd24Hr:
          double.tryParse(mapData['volumeUsd24Hr'] ?? kDoubleRevoker),
      percentExchangeVolume:
          double.tryParse(mapData['percentExchangeVolume'] ?? kDoubleRevoker),
      tradesCount24Hr: int.tryParse(mapData['tradesCount24Hr'] ?? kIntRevoker),
      updated: mapData['updated'],
    );
  }

  @override
  List<Object?> get props => [
        exchangeId,
        rank,
        baseSymbol,
        baseId,
        quoteSymbol,
        quoteId,
        priceQuote,
        priceUsd,
        volumeUsd24Hr,
        percentExchangeVolume,
        tradesCount24Hr,
        updated,
      ];

  @override
  bool get stringify => true;
}
