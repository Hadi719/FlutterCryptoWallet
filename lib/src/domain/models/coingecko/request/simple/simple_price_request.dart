class SimplePriceRequest {
  /// (Required) id of coins, comma-separated if querying more than 1 coin
  ///
  /// *refers to ___coins/list___
  final String ids;

  /// (Required) vs_currency of coins, comma-separated if querying more than 1 vs_currency
  ///
  /// *refers to <b>`simple/supported_vs_currencies`</b>
  final String vsCurrencies;

  /// To include market_cap, <b>default: false</b>
  final bool? includeMarketCap;

  /// To include 24hr_vol, <b>default: false</b>
  final bool? include24hrVol;

  /// To include 24hr_change, <b>default: false</b>
  final bool? include24hrChange;

  /// To include last_updated_at of price, <b>default: false</b>
  final bool? includeLastUpdatedAt;

  /// <b>full</b> or any value between 0 - 18 to specify decimal place for currency price value
  final int? precision;

  const SimplePriceRequest({
    required this.ids,
    required this.vsCurrencies,
    this.includeMarketCap,
    this.include24hrVol,
    this.include24hrChange,
    this.includeLastUpdatedAt,
    this.precision,
  });
}
