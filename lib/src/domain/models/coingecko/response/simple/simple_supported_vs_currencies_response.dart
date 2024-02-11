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

/*class SimpleSupportedVsCurrenciesResponse extends Equatable {
  const SimpleSupportedVsCurrenciesResponse({this.currenciesList = const []});

  final List<String> currenciesList;

  factory SimpleSupportedVsCurrenciesResponse.fromMap(List<dynamic> mapData) {
    List<String> data =
        List.from(mapData).map((dynamic e) => e as String).toList();
    return SimpleSupportedVsCurrenciesResponse(
      currenciesList: data,
    );
  }

  @override
  List<Object?> get props => [currenciesList];

  @override
  bool get stringify => true;
}*/
