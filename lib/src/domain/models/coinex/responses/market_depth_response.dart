import 'package:equatable/equatable.dart';

import '../../../../utils/constants/strings.dart';

/// Defines market depth parameters:
///
/// * [MarketDepthResponse.askOrders]
/// * [MarketDepthResponse.bidOrders]
class MarketDepthOrder extends Equatable {
  final double? price;
  final double? amount;

  const MarketDepthOrder({
    this.price,
    this.amount,
  });

  factory MarketDepthOrder.fromMap(List<dynamic> jsonData) {
    return MarketDepthOrder(
      price: double.tryParse(jsonData[0][0] ?? kDoubleRevoker),
      amount: double.tryParse(jsonData[0][1] ?? kDoubleRevoker),
    );
  }

  @override
  List<Object?> get props => [price, amount];

  @override
  bool? get stringify => true;
}

/// {@template MarketDepthResponse}
///
/// Gets market depth in a single market.
///
/// * Signature required: No
///
/// {@endtemplate}
class MarketDepthResponse extends Equatable {
  final DateTime time;
  final double? latestTransactionPrice;
  final List<MarketDepthOrder> askOrders;
  final List<MarketDepthOrder> bidOrders;

  /// {@macro MarketDepthResponse}
  const MarketDepthResponse({
    required this.time,
    this.latestTransactionPrice,
    this.askOrders = const <MarketDepthOrder>[],
    this.bidOrders = const <MarketDepthOrder>[],
  });

  /// {@macro MarketDepthResponse}
  factory MarketDepthResponse.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> data = map['data'];
    return MarketDepthResponse(
      time: DateTime.fromMillisecondsSinceEpoch(data['time']),
      latestTransactionPrice: double.tryParse(data['last'] ?? kDoubleRevoker),
      askOrders: (data['asks'] as List)
          .map((e) => MarketDepthOrder.fromMap(e))
          .toList(),
      bidOrders: (data['bids'] as List)
          .map((e) => MarketDepthOrder.fromMap(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        time,
        latestTransactionPrice,
        askOrders,
        bidOrders,
      ];

  @override
  bool? get stringify => true;
}
