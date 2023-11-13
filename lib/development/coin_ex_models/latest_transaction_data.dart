/// {@template LatestTransactionData}
///
/// latest transaction data of a single market.
///
/// * Signature required: No
/// * Max. return of 1000 records
///
/// {@endtemplate}
class LatestTransactionData {
  /// {@macro LatestTransactionData}
  const LatestTransactionData({
    required this.id,
    required this.dateTime,
    required this.dateTimeMilliseconds,
    required this.amount,
    required this.price,
    required this.type,
  });

  static const String urlPath = '/market/deals';

  final int id;
  final int dateTime;
  final DateTime dateTimeMilliseconds;
  final double amount;
  final double price;
  final String type;

  factory LatestTransactionData.fromJson(Map<String, dynamic> jsonData) {
    return LatestTransactionData(
      id: jsonData['id'] ?? 0,
      dateTime: jsonData['date'] ?? 0,
      dateTimeMilliseconds:
          DateTime.fromMillisecondsSinceEpoch(jsonData['date_ms']),
      amount: double.tryParse(jsonData['amount']) ?? 0.0,
      price: double.tryParse(jsonData['price']) ?? 0.0,
      type: jsonData['type'] ?? '',
    );
  }

  @override
  String toString() {
    return '\n\n=======   $this   =======\n'
        'id: $id \n'
        'DateTime: ${dateTime.toString()}\n'
        'DateTime Milliseconds: $dateTimeMilliseconds\n'
        'Amount: $amount\n'
        'Price: $price\n'
        'Type: $type\n'
        '=========================================';
  }
}
