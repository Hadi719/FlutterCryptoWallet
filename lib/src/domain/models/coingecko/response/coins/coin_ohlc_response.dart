import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_ohlc_response.freezed.dart';
part 'coin_ohlc_response.g.dart';

/// {@macro CoinOHLC}
@Freezed(toJson: false)
class CoinOHLCResponse with _$CoinOHLCResponse {
  /// {@macro CoinOHLC}
  const factory CoinOHLCResponse({
    List<OHLCValues>? ohlcList,
  }) = _CoinOHLCResponse;

  /// {@macro CoinOHLC}
  factory CoinOHLCResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinOHLCResponseFromJson(json);
}

@Freezed(toJson: false, fromJson: false)
class OHLCValues with _$OHLCValues {
  const factory OHLCValues({
    required int time,
    required double open,
    required double high,
    required double low,
    required double close,
  }) = _OHLCValues;

  factory OHLCValues.fromJson(List<dynamic> json) => OHLCValues(
        time: json[0],
        open: json[1],
        high: json[2],
        low: json[3],
        close: json[4],
      );
}
