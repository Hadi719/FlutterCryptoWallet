enum CandlesIntervals {
  /// 1 Minute
  m1,

  /// 5 Minutes
  m5,

  /// 15 Minutes
  m15,

  /// 30 Minutes
  m30,

  /// 1 Hour
  h1,

  /// 2 Hours
  h2,

  /// 4 Hours
  h4,

  /// 8 Hours
  h8,

  /// 12 Hours
  h12,

  /// 1 Day
  d1,

  /// 1 Week
  w1,
}

/// The /candles endpoint offers a look into how a market has performed historically.
/// This data is represented in OHLCV candles - Open, High, Low, Close, and Volume.
/// Please note that many parameters are required to request candles for a specific market.
/// Candle history goes back to the inception of an exchange -
/// you may even find data for exchanges that have come and gone!
class CandlesListRequest {
  /// exchange id
  ///
  /// required
  ///
  /// e.g.  poloniex
  final String exchange;

  /// candle interval
  ///
  /// required
  ///
  /// e.g.  m1, m5, m15, m30, h1, h2, h4, h8, h12, d1, w1
  final CandlesIntervals interval;

  /// base id
  ///
  /// required
  ///
  /// e.g.  ethereum
  final String baseId;

  /// quote id
  ///
  /// required
  ///
  /// e.g.  bitcoin
  final String quoteId;

  /// UNIX time in milliseconds. omiting will return the most recent candles
  ///
  /// optional
  ///
  /// e.g.  1528410925604
  final int? start;

  /// UNIX time in milliseconds. omiting will return the most recent candles
  ///
  /// optional
  ///
  /// e.g.  1528411045604
  final int? end;

  const CandlesListRequest({
    required this.exchange,
    this.interval = CandlesIntervals.d1,
    required this.baseId,
    required this.quoteId,
    this.start,
    this.end,
  });
}
