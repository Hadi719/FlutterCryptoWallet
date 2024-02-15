import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_rates_response.freezed.dart';
part 'exchange_rates_response.g.dart';

/// {@macro ExchangeRates}
@Freezed(toJson: false, fromJson: false)
class ExchangeRatesResponse with _$ExchangeRatesResponse {
  /// {@macro ExchangeRates}
  factory ExchangeRatesResponse({List<RatesResponse>? rates}) =
      _ExchangeRatesResponse;

  /// {@macro ExchangeRates}
  factory ExchangeRatesResponse.fromJson(Map<String, dynamic> json) {
    var ratesMap = json['rates'] as Map<String, dynamic>;
    var ratesValues = ratesMap.values;
    List<RatesResponse> rates =
        List.from(ratesValues.map((e) => RatesResponse.fromJson(e)).toList());

    return ExchangeRatesResponse(rates: rates);
  }
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
