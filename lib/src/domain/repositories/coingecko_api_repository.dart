import '../../utils/resources/data_state.dart';
import '../models/coingecko/request/request.dart';
import '../models/coingecko/response/response.dart';

abstract class CoinGeckoApiRepository {
  Future<DataState<SimplePricesListResponse>> getSimplePricesList({
    required SimplePriceRequest request,
  });
  Future<DataState<SimpleSupportedVsCurrenciesResponse>>
      getSimpleSupportedVsCurrencies({
    required SimpleSupportedVsCurrenciesRequest request,
  });
  Future<DataState<CoinMetadataResponse>> getCoinMetadata({
    required CoinMetadataRequest request,
  });
  Future<DataState<CoinHistoryResponse>> getCoinHistory({
    required CoinHistoryRequest request,
  });
  Future<DataState<CoinsMarketsListResponse>> getCoinsMarketsList({
    required CoinsMarketsListRequest request,
  });

  /// {@macro CoinMarketChart}
  Future<DataState<CoinMarketChartResponse>> getCoinMarketChart({
    required CoinMarketChartRequest request,
  });

  /// {@macro CoinMarketChartRange}
  Future<DataState<CoinMarketChartRangeResponse>> getCoinMarketChartRange({
    required CoinMarketChartRangeRequest request,
  });

  /// {@macro CoinOHLC}
  Future<DataState<CoinOHLCResponse>> getCoinOHLC({
    required CoinOHLCRequest request,
  });
}
