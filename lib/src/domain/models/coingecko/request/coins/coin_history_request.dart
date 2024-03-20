import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_history_request.freezed.dart';
part 'coin_history_request.g.dart';

@freezed
class CoinHistoryRequest with _$CoinHistoryRequest {
  const factory CoinHistoryRequest({
    /// (Required) pass the coin id (can be obtained from /coins) eg. bitcoin
    required String id,

    /// (Required) The date of data snapshot in dd-mm-yyyy eg. 30-12-2022
    required String date,

    /// Set to false to exclude localized languages in response
    String? localization,
  }) = _CoinHistoryRequest;

  factory CoinHistoryRequest.fromJson(Map<String, dynamic> json) =>
      _$CoinHistoryRequestFromJson(json);
}
