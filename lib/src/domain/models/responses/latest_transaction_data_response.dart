import 'package:equatable/equatable.dart';

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

/// {@template LatestTransactionDataResponse}
///
/// Gets the latest transaction data of a single market.
///
/// * Signature required: No
///
/// {@endtemplate}
class LatestTransactionDataResponse extends Equatable {
  final int id;
  final int dateTime;
  final DateTime dateTimeMilliseconds;
  final double amount;
  final double price;
  final LatestTransactionDataType type;

  /// {@macro: LatestTransactionDataResponse}
  const LatestTransactionDataResponse({
    required this.id,
    required this.dateTime,
    required this.dateTimeMilliseconds,
    required this.amount,
    required this.price,
    required this.type,
  });

  /// {@macro: LatestTransactionDataResponse}
  factory LatestTransactionDataResponse.fromMap(Map<String, dynamic> map) {
    return LatestTransactionDataResponse(
      id: map['id'] ?? 0,
      dateTime: map['date'] ?? 0,
      dateTimeMilliseconds: DateTime.fromMillisecondsSinceEpoch(map['date_ms']),
      amount: double.tryParse(map['amount']) ?? 0.0,
      price: double.tryParse(map['price']) ?? 0.0,
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
