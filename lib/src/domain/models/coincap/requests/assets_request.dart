/// The asset price is a volume-weighted average calculated by collecting ticker
/// data from exchanges.
///
/// Each exchange contributes to this price in relation to their volume,
/// meaning higher volume exchanges have more affect on this global price.
/// All values are translated into USD (United States Dollar) and can be
/// translated into other units of measurement through the /rates endpoint
class AssetsRequest {
  const AssetsRequest({this.search, this.ids, this.limit, this.offset});

  /// search by asset id (bitcoin) or symbol (BTC)
  ///
  /// optional
  ///
  /// e.g. ___bitcoin___
  final String? search;

  /// query with multiple ids=bitcoin,ethereum,monero
  ///
  /// optional
  ///
  /// e.g. ___bitcoin___
  final String? ids;

  /// max limit of 2000
  ///
  /// optional
  ///
  /// e.g. ___5___
  final int? limit;

  /// offset
  ///
  /// optional
  ///
  /// e.g. ___1___
  final int? offset;
}
