import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_market_chart_response.freezed.dart';
part 'coin_market_chart_response.g.dart';

/// {@macro CoinMarketChart}
@freezed
class CoinMarketChartResponse with _$CoinMarketChartResponse {
  /// {@macro CoinMarketChart}
  const factory CoinMarketChartResponse(
    List<List<double>> prices,
    @JsonKey(name: 'market_caps') List<List<double>> marketCaps,
    @JsonKey(name: 'total_volumes') List<List<double>> totalVolumes,
  ) = _CoinMarketChartResponse;

  /// {@macro CoinMarketChart}
  factory CoinMarketChartResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketChartResponseFromJson(json);
}
