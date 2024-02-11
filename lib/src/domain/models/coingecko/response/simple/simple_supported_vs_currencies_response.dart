import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_supported_vs_currencies_response.freezed.dart';
part 'simple_supported_vs_currencies_response.g.dart';

@freezed
class SimpleSupportedVsCurrenciesResponse
    with _$SimpleSupportedVsCurrenciesResponse {
  const factory SimpleSupportedVsCurrenciesResponse(
    List<String>? currenciesList,
  ) = _SimpleSupportedVsCurrenciesResponse;

  factory SimpleSupportedVsCurrenciesResponse.fromJson(json) =>
      _$SimpleSupportedVsCurrenciesResponseFromJson(json);
}
