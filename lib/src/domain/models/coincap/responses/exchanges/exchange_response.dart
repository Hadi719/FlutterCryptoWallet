import 'package:equatable/equatable.dart';

import '../../../../../utils/constants/strings.dart';

class ExchangeResponse extends Equatable {
  /// unique identifier for exchange
  final String? id;

  /// proper name of exchange
  final String? name;

  /// rank is in ascending order - this number is directly associated with the
  /// total exchange volume whereas the highest volume exchange receives rank 1
  final int? rank;

  /// the amount of daily volume a single exchange transacts in relation to
  /// total daily volume of all exchanges
  final double? percentTotalVolume;

  /// daily volume represented in USD
  final double? volumeUsd;

  /// number of trading pairs (or markets) offered by exchange
  final int? tradingPairs;

  /// true = trade socket available, false = trade socket unavailable
  final bool? socket;

  /// website to exchange
  final String? exchangeUrl;

  /// UNIX timestamp (milliseconds) since information was received from this exchange
  final int? updated;

  final int? timestamp;

  const ExchangeResponse({
    this.id,
    this.name,
    this.rank,
    this.percentTotalVolume,
    this.volumeUsd,
    this.tradingPairs,
    this.socket,
    this.exchangeUrl,
    this.updated,
    this.timestamp,
  });

  factory ExchangeResponse.fromMap(Map<String, dynamic> mapData) {
    Map<String, dynamic> data = mapData['data'] ?? mapData;
    return ExchangeResponse(
      id: data['id'],
      name: data['name'],
      rank: int.tryParse(data['rank'] ?? kIntRevoker),
      percentTotalVolume:
          double.tryParse(data['percentTotalVolume'] ?? kDoubleRevoker),
      volumeUsd: double.tryParse(data['volumeUsd'] ?? kDoubleRevoker),
      tradingPairs: int.tryParse(data['tradingPairs'] ?? kIntRevoker),
      socket: data['socket'],
      exchangeUrl: data['exchangeUrl'],
      updated: data['updated'],
      timestamp: mapData['timestamp'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        rank,
        percentTotalVolume,
        volumeUsd,
        tradingPairs,
        socket,
        exchangeUrl,
        updated,
        timestamp,
      ];

  @override
  bool get stringify => true;
}
