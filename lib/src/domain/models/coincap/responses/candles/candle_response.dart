import 'package:equatable/equatable.dart';

import '../../../../../utils/constants/strings.dart';

class CandleResponse extends Equatable {
  const CandleResponse({
    this.open,
    this.high,
    this.low,
    this.close,
    this.volume,
    this.period,
  });

  /// the price (quote) at which the first transaction was completed in a given time period
  final double? open;

  /// the top price (quote) at which the base was traded during the time period
  final double? high;

  /// the bottom price (quote) at which the base was traded during the time period
  final double? low;

  /// the price (quote) at which the last transaction was completed in a given time period
  final double? close;

  /// the amount of base asset traded in the given time period
  final double? volume;

  /// timestamp for starting of that time period, represented in UNIX milliseconds
  final DateTime? period;

  factory CandleResponse.fromMap(Map<String, dynamic> mapData) {
    return CandleResponse(
      open: double.tryParse(mapData['open'] ?? kDoubleRevoker),
      high: double.tryParse(mapData['high'] ?? kDoubleRevoker),
      low: double.tryParse(mapData['low'] ?? kDoubleRevoker),
      close: double.tryParse(mapData['close'] ?? kDoubleRevoker),
      volume: double.tryParse(mapData['volume'] ?? kDoubleRevoker),
      period: DateTime.fromMillisecondsSinceEpoch(
        mapData['period'],
        isUtc: true,
      ),
    );
  }

  @override
  List<Object?> get props => [open, high, low, close, volume, period];

  @override
  bool get stringify => true;
}
