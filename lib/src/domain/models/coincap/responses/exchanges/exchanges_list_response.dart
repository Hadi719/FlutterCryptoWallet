import 'package:equatable/equatable.dart';

import 'exchange_response.dart';

class ExchangesListResponse extends Equatable {
  final List<ExchangeResponse> exchangesList;

  final int? timestamp;

  const ExchangesListResponse({
    this.exchangesList = const [],
    this.timestamp,
  });

  factory ExchangesListResponse.fromMap(Map<String, dynamic> mapData) {
    return ExchangesListResponse(
      exchangesList: List.from(mapData['data'])
          .map((e) => ExchangeResponse.fromMap(e))
          .toList(),
      timestamp: mapData['timestamp'],
    );
  }

  @override
  List<Object?> get props => [exchangesList, timestamp];

  @override
  bool get stringify => true;
}
