class AssetHistoriesRequest {
  /// asset id
  ///
  /// __required__
  ///
  /// e.g. ___bitcoin___
  final String id;

  /// point-in-time interval.
  ///
  /// minute and hour intervals represent price at that time,
  /// the day interval represents average of 24 hour periods (timezone: UTC)
  ///
  /// __required__
  final HistoryIntervals interval;

  /// UNIX time in milliseconds.
  ///
  /// omitting will return the most recent asset history.
  /// If start is supplied, end is required and vice versa
  ///
  /// Optional
  final int? start;

  /// UNIX time in milliseconds.
  ///
  /// omitting will return the most recent asset history.
  /// If start is supplied, end is required and vice versa
  ///
  /// Optional
  final int? end;

  const AssetHistoriesRequest({
    required this.id,
    this.interval = HistoryIntervals.d1,
    this.start,
    this.end,
  });
}

/// point-in-time interval.
///
/// minute and hour intervals represent price at that time,
/// the day interval represents average of 24 hour periods (timezone: UTC)
enum HistoryIntervals {
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

  /// 6 Hours
  h6,

  /// 12 Hours
  h12,

  /// 1 Day
  d1,
}
