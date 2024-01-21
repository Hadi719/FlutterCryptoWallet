import 'package:equatable/equatable.dart';

import '../../../../utils/constants/strings.dart';

/// {@template LatestTransactionDataResponse}
///
/// Gets the latest transaction data of a single market.
///
/// * Signature required: No
/// * Max.return: 1000
///
/// {@endtemplate}
class LatestTransactionDataResponse extends Equatable {
  /// List of [LatestTransactionData].
  final List<LatestTransactionData> data;

  /// {@macro: LatestTransactionDataResponse}
  const LatestTransactionDataResponse(
      {this.data = const <LatestTransactionData>[]});

  /// {@macro: LatestTransactionDataResponse}
  factory LatestTransactionDataResponse.fromMap(Map<String, dynamic> map) {
    var mapData = map['data'] ?? map;
    return LatestTransactionDataResponse(
      data: (mapData as List)
          .map((e) => LatestTransactionData.fromMap(e))
          .toList(),
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [data];
}

/// {@macro: LatestTransactionDataResponse}
class LatestTransactionData extends Equatable {
  final int id;
  final int dateTime;
  final DateTime dateTimeMilliseconds;
  final double? amount;
  final double? price;
  final LatestTransactionDataType type;

  /// {@macro: LatestTransactionDataResponse}
  const LatestTransactionData({
    required this.id,
    required this.dateTime,
    required this.dateTimeMilliseconds,
    this.amount,
    this.price,
    required this.type,
  });

  /// {@macro: LatestTransactionDataResponse}
  factory LatestTransactionData.fromMap(Map<String, dynamic> map) {
    return LatestTransactionData(
      id: map['id'] ?? 0,
      dateTime: map['date'] ?? 0,
      dateTimeMilliseconds: DateTime.fromMillisecondsSinceEpoch(map['date_ms']),
      amount: double.tryParse(map['amount'] ?? kDoubleRevoker),
      price: double.tryParse(map['price'] ?? kDoubleRevoker),
      type: LatestTransactionDataType.fromString(map['type']),
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        dateTime,
        dateTimeMilliseconds,
        amount,
        price,
        type,
      ];
}

/// Defines latest transaction data parameter [LatestTransactionData.type].
enum LatestTransactionDataType {
  unknown,
  buy,
  sell;

  factory LatestTransactionDataType.fromString(String type) {
    if (type == 'buy') return LatestTransactionDataType.buy;
    if (type == 'sell') return LatestTransactionDataType.sell;
    return LatestTransactionDataType.unknown;
  }
}
