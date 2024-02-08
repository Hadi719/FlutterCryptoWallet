import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_history_response.freezed.dart';
part 'coin_history_response.g.dart';

@freezed
class CoinHistoryResponse with _$CoinHistoryResponse {
  const factory CoinHistoryResponse(
    String? id,
    String? symbol,
    String? name,
    Map<String, dynamic> localization,
    Map<String, dynamic> image,
    @JsonKey(name: 'market_data') Map<String, dynamic> marketData,
    @JsonKey(name: 'community_data') Map<String, dynamic> communityData,
    @JsonKey(name: 'developer_data') Map<String, dynamic> developerData,
    @JsonKey(name: 'public_interest_stats')
    Map<String, dynamic> publicInterestStats,
  ) = _CoinHistoryResponse;

  factory CoinHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinHistoryResponseFromJson(json);
}

/*class CoinHistoryResponse extends Equatable {
  const CoinHistoryResponse({
    this.id,
    this.symbol,
    this.name,
    this.localization = const {},
    this.image = const {},
    this.marketData = const {},
    this.communityData = const {},
    this.developerData = const {},
    this.publicInterestStats = const {},
  });

  final String? id;
  final String? symbol;
  final String? name;
  final Map<String, dynamic> localization;
  final Map<String, dynamic> image;
  final Map<String, dynamic> marketData;
  final Map<String, dynamic> communityData;
  final Map<String, dynamic> developerData;
  final Map<String, dynamic> publicInterestStats;

  @override
  List<Object?> get props => [
        id,
        symbol,
        name,
        localization,
        image,
        marketData,
        communityData,
        developerData,
        publicInterestStats,
      ];

  @override
  bool get stringify => true;
}*/
