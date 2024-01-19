class AssetHistoryRequest {
  const AssetHistoryRequest({
    required this.id,
    this.interval = Intervals.oneDay,
    this.start,
    this.end,
  });

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
  final Intervals interval;

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
}

/// point-in-time interval.
///
/// minute and hour intervals represent price at that time,
/// the day interval represents average of 24 hour periods (timezone: UTC)
enum Intervals {
  oneMinute('m1'),
  fiveMinute('m5'),
  fifteenMinute('m15'),
  thirtyMinute('m30'),
  oneHour('h1'),
  twoHour('h2'),
  sixHour('h6'),
  twelveHour('h12'),
  oneDay('d1');

  const Intervals(this.value);
  final String value;
}
