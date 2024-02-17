import 'package:equatable/equatable.dart';

/// {@template AllMarketListResponse}
///
/// a list of all cryptos name.
///
/// * Signature required: No
///
/// {@endtemplate}
class AllMarketListResponse extends Equatable {
  /// List of cryptos market name.
  final List<String> data;

  /// {@macro AllMarketListResponse}
  const AllMarketListResponse({this.data = const <String>[]});

  /// {@macro AllMarketListResponse}
  factory AllMarketListResponse.fromMap(Map<String, dynamic> map) {
    return AllMarketListResponse(
      data: map['data'] != null ? List<String>.from(map['data']) : [],
    );
  }

  @override
  List<Object?> get props => [data];

  @override
  bool? get stringify => true;
}
