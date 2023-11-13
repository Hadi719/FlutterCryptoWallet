/// {@template MarketDepth}
///
/// Market depth in a single market.
///
/// * Signature required: No
/// * Max. depth 50
///
/// {@endtemplate}
class MarketDepth {
  /// {@macro MarketDepth}
  const MarketDepth({
    required this.latestTransactionPrice,
    required this.time,
    this.askOrders = const <Order>[],
    this.bidOrders = const <Order>[],
  });

  static const urlPath = '/market/depth';

  final double latestTransactionPrice;
  final DateTime time;
  final List<Order> askOrders;
  final List<Order> bidOrders;

  factory MarketDepth.fromJson(Map<String, dynamic> jsonData) {
    Map<String, dynamic> data = jsonData['data'];
    return MarketDepth(
      latestTransactionPrice: double.tryParse(data['last']) ?? 0.0,
      time: DateTime.fromMillisecondsSinceEpoch(data['time']),
      askOrders: (data['asks'] as List).map((e) => Order.fromJson(e)).toList(),
      bidOrders: (data['bids'] as List).map((e) => Order.fromJson(e)).toList(),
    );
  }

  @override
  String toString() {
    return 'latestTransactionPrice: $latestTransactionPrice\n'
        'time: ${time.toString()}\n'
        'askOrderPrice: ${askOrders.toString()}\n'
        'bidOrderPrice: ${bidOrders.toString()}\n';
  }
}

class Order {
  Order({
    this.price = 0.0,
    this.amount = 0.0,
  });

  final double price;
  final double amount;

  factory Order.fromJson(List<String> jsonData) {
    return Order(
      price: double.tryParse(jsonData[0][0]) ?? 0.0,
      amount: double.tryParse(jsonData[0][1]) ?? 0.0,
    );
  }

  @override
  String toString() {
    return '\n\n=======   $this   =======\n'
        'Order [price:$price, amount:$amount]\n'
        '=========================================';
  }
}
