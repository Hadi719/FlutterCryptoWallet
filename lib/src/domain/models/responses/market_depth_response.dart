import 'package:equatable/equatable.dart';

/// {@template MarketDepthResponse}
///
/// Gets market depth in a single market.
///
/// * Signature required: No
///
/// {@endtemplate}
class MarketDepthResponse extends Equatable {
  final DateTime time;
  final double latestTransactionPrice;
  final List<MarketDepthOrder> askOrders;
  final List<MarketDepthOrder> bidOrders;

  /// {@macro MarketDepthResponse}
  const MarketDepthResponse({
    required this.time,
    required this.latestTransactionPrice,
    this.askOrders = const <MarketDepthOrder>[],
    this.bidOrders = const <MarketDepthOrder>[],
  });

  /// {@macro MarketDepthResponse}
  factory MarketDepthResponse.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> data = map['data'];
    return MarketDepthResponse(
      time: DateTime.fromMillisecondsSinceEpoch(data['time']),
      latestTransactionPrice: double.tryParse(data['last']) ?? 0.0,
      askOrders: (data['asks'] as List)
          .map((e) => MarketDepthOrder.fromMap(e))
          .toList(),
      bidOrders: (data['bids'] as List)
          .map((e) => MarketDepthOrder.fromMap(e))
          .toList(),
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        time,
        latestTransactionPrice,
        askOrders,
        bidOrders,
      ];
}

class MarketDepthOrder extends Equatable {
  final double price;
  final double amount;

  const MarketDepthOrder({
    this.price = 0.0,
    this.amount = 0.0,
  });

  factory MarketDepthOrder.fromMap(List<dynamic> jsonData) {
    return MarketDepthOrder(
      price: double.tryParse(jsonData[0][0]) ?? 0.0,
      amount: double.tryParse(jsonData[0][1]) ?? 0.0,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [price, amount];
}
