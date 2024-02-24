import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_supported_vs_currencies_response.freezed.dart';
part 'simple_supported_vs_currencies_response.g.dart';

@Freezed(toJson: false)
class SimpleSupportedVsCurrenciesResponse
    with _$SimpleSupportedVsCurrenciesResponse {
  const factory SimpleSupportedVsCurrenciesResponse({
    List<String>? data,
  }) = _SimpleSupportedVsCurrenciesResponse;

  factory SimpleSupportedVsCurrenciesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SimpleSupportedVsCurrenciesResponseFromJson(json);
}
