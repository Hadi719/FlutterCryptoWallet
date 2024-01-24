/// Take a closer look into exchanges with the /markets endpoint.
/// Similar to the /exchanges endpoint, we strive to offer transparency into
/// how real-time our data is with a key identifying when the market was last updated.
/// For a historical view on how a market has performed, see the /candles endpoint.
/// All market data represents actual trades processed,
/// orders on an exchange are not represented.
/// Data received from individual markets is used to calculate the current price of an asset.
class MarketsListRequest {
  const MarketsListRequest({
    this.exchangeId,
    this.baseSymbol,
    this.quoteSymbol,
    this.baseId,
    this.quoteId,
    this.assetSymbol,
    this.assetId,
    this.limit,
    this.offset,
  });

  /// search by exchange id
  ///
  /// e.g. poloniex
  final String? exchangeId;

  /// returns all containing the base symbol
  ///
  /// e.g. BTC
  final String? baseSymbol;

  /// returns all containing the quote symbol
  ///
  /// e.g. ETH
  final String? quoteSymbol;

  /// returns all containing the base id
  ///
  /// e.g. bitcoin
  final String? baseId;

  /// returns all containing the quote id
  ///
  /// e.g. ethereum
  final String? quoteId;

  /// returns all assets containing symbol (base and quote)
  ///
  /// e.g. BTC
  final String? assetSymbol;

  /// returns all assets containing id (base and quote)
  ///
  /// e.g. bitcoin
  final String? assetId;

  /// max limit of 2000
  ///
  /// e.g. 5
  final int? limit;

  /// offset
  ///
  /// e.g. 1
  final int? offset;
}
