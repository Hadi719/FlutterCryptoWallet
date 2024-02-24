import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_market_chart_range_response.freezed.dart';
part 'coin_market_chart_range_response.g.dart';

/// {@macro CoinMarketChartRange}
@freezed
class CoinMarketChartRangeResponse with _$CoinMarketChartRangeResponse {
  /// {@macro CoinMarketChartRange}
  const factory CoinMarketChartRangeResponse({
    List<List<double>>? prices,
    @JsonKey(name: 'market_caps') List<List<double>>? marketCaps,
    @JsonKey(name: 'total_volumes') List<List<double>>? totalVolumes,
  }) = _CoinMarketChartRangeResponse;

  /// {@macro CoinMarketChartRange}
  factory CoinMarketChartRangeResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketChartRangeResponseFromJson(json);
}
