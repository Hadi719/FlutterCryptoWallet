import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_rates_response.freezed.dart';
part 'exchange_rates_response.g.dart';

/// {@macro ExchangeRates}
@Freezed(toJson: false)
class ExchangeRatesResponse with _$ExchangeRatesResponse {
  /// {@macro ExchangeRates}
  factory ExchangeRatesResponse({
    @RateResponseConverter() List<RatesResponse>? rates,
  }) = _ExchangeRatesResponse;

  /// {@macro ExchangeRates}
  factory ExchangeRatesResponse.fromJson(Map<String, Object?> json) =>
      _$ExchangeRatesResponseFromJson(json);
}

/// A JsonConverter for [ExchangeRatesResponse.rates]
class RateResponseConverter
    implements JsonConverter<List<RatesResponse>?, Map<String, dynamic>> {
  /// A JsonConverter for [ExchangeRatesResponse.rates]
  const RateResponseConverter();

  @override
  List<RatesResponse>? fromJson(Map<String, dynamic> json) {
    var ratesValues = json.values;
    List<RatesResponse> rates =
        List.from(ratesValues.map((e) => RatesResponse.fromJson(e)).toList());
    return rates;
  }

  @override
  Map<String, dynamic> toJson(List<RatesResponse>? object) => {};
}

/// {@macro ExchangeRates}
@Freezed(toJson: false)
class RatesResponse with _$RatesResponse {
  /// {@macro ExchangeRates}
  const factory RatesResponse({
    String? name,
    String? unit,
    double? value,
    String? type,
  }) = _RatesResponse;

  /// {@macro ExchangeRates}
  factory RatesResponse.fromJson(Map<String, dynamic> json) =>
      _$RatesResponseFromJson(json);
}
