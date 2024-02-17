import 'package:equatable/equatable.dart';

import 'candle_response.dart';

class CandlesListResponse extends Equatable {
  final List<CandleResponse> candlesList;

  final DateTime? timestamp;

  const CandlesListResponse({
    this.candlesList = const [],
    this.timestamp,
  });

  factory CandlesListResponse.fromMap(Map<String, dynamic> mapData) {
    return CandlesListResponse(
      candlesList: List.from(mapData['data'])
          .map((e) => CandleResponse.fromMap(e))
          .toList(),
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        mapData['timestamp'],
        isUtc: true,
      ),
    );
  }

  @override
  List<Object?> get props => [candlesList, timestamp];
}
