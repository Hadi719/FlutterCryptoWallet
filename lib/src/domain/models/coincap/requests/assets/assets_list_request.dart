class AssetsListRequest {
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

  const AssetsListRequest({this.search, this.ids, this.limit, this.offset});
}
