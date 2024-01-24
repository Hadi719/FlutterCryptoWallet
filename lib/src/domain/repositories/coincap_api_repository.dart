import '../../utils/resources/data_state.dart';
import '../models/coincap/requests/requests.dart';
import '../models/coincap/responses/responses.dart';

abstract class CoinCapApiRepository {
  Future<DataState<AssetsListResponse>> getAssetsList({
    required AssetsListRequest request,
  });
  Future<DataState<AssetResponse>> getAsset({
    required AssetRequest request,
  });
  Future<DataState<AssetHistoriesResponse>> getAssetHistories({
    required AssetHistoriesRequest request,
  });
  Future<DataState<AssetMarketsResponse>> getAssetMarkets({
    required AssetMarketsRequest request,
  });
  Future<DataState<RatesListResponse>> getRatesList({
    required RatesListRequest request,
  });
  Future<DataState<RateResponse>> getRate({
    required RateRequest request,
  });
  Future<DataState<ExchangesListResponse>> getExchangesList({
    required ExchangesListRequest request,
  });
  Future<DataState<ExchangeResponse>> getExchange({
    required ExchangeRequest request,
  });
}
