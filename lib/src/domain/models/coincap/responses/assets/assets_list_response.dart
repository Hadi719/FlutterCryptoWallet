import 'package:equatable/equatable.dart';

import 'asset_response.dart';

class AssetsListResponse extends Equatable {
  const AssetsListResponse({
    this.assetsList = const [],
    required this.timestamp,
  });

  final List<AssetResponse> assetsList;
  final int timestamp;

  factory AssetsListResponse.fromMap(Map<String, dynamic> json) {
    return AssetsListResponse(
      assetsList: List.from(json['data']).map((e) {
        Map<String, dynamic> editedMap = e;
        editedMap['timestamp'] = json['timestamp'];
        return AssetResponse.fromMap(editedMap);
      }).toList(),
      timestamp: json['timestamp'],
    );
  }

  @override
  List<Object?> get props => [assetsList, timestamp];

  @override
  bool get stringify => true;
}
