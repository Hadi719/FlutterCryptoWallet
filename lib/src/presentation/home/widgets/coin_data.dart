import 'package:flutter/widgets.dart';

import '../../../domain/models/coingecko/response/coins/coins_markets_list_response.dart';

class CoinData extends StatelessWidget {
  final CoinMarketData? coin;

  final double imageSize;
  const CoinData({super.key, required this.coin, required this.imageSize});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 10,
      // crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.start,
      // runAlignment: WrapAlignment.center,
      direction: Axis.horizontal,
      children: [
        SizedBox(width: imageSize),
        _CoinText(
          '${coin?.name ?? 'Oops'}\n ${coin?.symbol ?? 'Oops'}',
        ),
        _CoinText(
          'Price\n${coin?.currentPrice.toString() ?? 'Oops'}',
        ),
        _CoinText(
          'Market Cap\n${coin?.marketCap.toString() ?? 'Oops'}',
        ),
        _CoinText(
          '24h\n${coin?.priceChangePercentage24h.toString() ?? 'Oops'}',
        ),
      ],
    );
  }
}

class _CoinText extends StatelessWidget {
  final String data;
  const _CoinText(this.data);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
    );
  }
}
