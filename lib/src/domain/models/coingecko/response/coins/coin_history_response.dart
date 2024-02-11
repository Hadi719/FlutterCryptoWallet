import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_history_response.freezed.dart';
part 'coin_history_response.g.dart';

@Freezed(toJson: false)
class CoinHistoryResponse with _$CoinHistoryResponse {
  const factory CoinHistoryResponse({
    String? id,
    String? symbol,
    String? name,
    Map<String, dynamic>? localization,
    Map<String, dynamic>? image,
    @JsonKey(name: 'market_data') Map<String, dynamic>? marketData,
    @JsonKey(name: 'community_data') Map<String, dynamic>? communityData,
    @JsonKey(name: 'developer_data') Map<String, dynamic>? developerData,
    @JsonKey(name: 'public_interest_stats')
    Map<String, dynamic>? publicInterestStats,
  }) = _CoinHistoryResponse;

  factory CoinHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinHistoryResponseFromJson(json);
}
