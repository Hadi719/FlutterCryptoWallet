import 'package:equatable/equatable.dart';

class SimpleSupportedVsCurrenciesResponse extends Equatable {
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
}
