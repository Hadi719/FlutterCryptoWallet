import 'package:equatable/equatable.dart';

/// {@template AllMarketListResponse}
///
/// a list of all cryptos name.
///
/// * Signature required: No
///
/// {@endtemplate}
class AllMarketListResponse extends Equatable {
  /// {@macro AllMarketListResponse}
  const AllMarketListResponse({this.allMarketList = const <String>[]});

  final List<String> allMarketList;

  /// {@macro AllMarketListResponse}
  factory AllMarketListResponse.fromMap(Map<String, dynamic> map) {
    return AllMarketListResponse(
      allMarketList: map['data'] != null ? List<String>.from(map['data']) : [],
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [allMarketList];
}
