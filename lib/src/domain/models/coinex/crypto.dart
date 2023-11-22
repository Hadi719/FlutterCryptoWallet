import 'package:equatable/equatable.dart';

import '../../../utils/constants/strings.dart';

/// Crypto model based on CoinEx api.
class Crypto extends Equatable {
  const Crypto({
    required this.marketName,
    required this.minAmount,
    required this.markerFeeRate,
    required this.takerFeeRate,
    required this.pricingName,
    required this.pricingDecimal,
    required this.tradingName,
    required this.tradingDecimal,
  });

  final String marketName;
  final double minAmount;
  final double markerFeeRate;
  final double takerFeeRate;
  final String pricingName;
  final int pricingDecimal;
  final String tradingName;
  final int tradingDecimal;

  factory Crypto.fromJson(Map<String, dynamic> jsonData) {
    Map<String, dynamic> data = jsonData['data'];
    return Crypto(
      marketName: data['name'] ?? '',
      minAmount: double.tryParse(data['min_amount']) ?? 0.0,
      markerFeeRate: double.tryParse(data['maker_fee_rate']) ?? 0.0,
      takerFeeRate: double.tryParse(data['taker_fee_rate']) ?? 0.0,
      pricingName: data['pricing_name'] ?? '',
      pricingDecimal: data['pricing_decimal'] ?? 0,
      tradingName: data['trading_name'] ?? '',
      tradingDecimal: data['trading_decimal'] ?? 0,
    );
  }
  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        marketName,
        minAmount,
        markerFeeRate,
        takerFeeRate,
        pricingName,
        pricingDecimal,
        tradingName,
        tradingDecimal,
      ];

  /*
  @override
  String toString() {
    return '\n\n=======   $this   =======\n'
        '$marketName\n'
        'minAmount: $minAmount\n'
        'markerFeeRate: $markerFeeRate\n'
        'takerFeeRate: $takerFeeRate\n'
        'pricingName: $pricingName\n'
        'pricingDecimal: $pricingDecimal\n'
        'tradingName: $tradingName\n'
        'tradingDecimal: $tradingDecimal\n'
        '=============================';
  }
  */
}

/// Forbes Top 10 Cryptocurrencies For December 2022.
/// 1. Bitcoin (BTC)
/// 2. Ethereum (ETH)
/// 3. Tether (USDT)
/// 4. Binance Coin (BNB)
/// 5. U.S. Dollar Coin (USDC)
/// 6. XRP (XRP)
/// 7. Cardano (ADA)
/// 8. Solana (SOL)
/// 9. Polkadot (DOT)
/// 10. Dogecoin (DOGE)
enum CryptoDetail {
  btc(
    name: 'Bitcoin',
    tradingName: 'BTC',
    marketName: 'BTCUSDT',
    iconPath: btcIconPath,
  ),
  eth(
    name: 'Ethereum',
    tradingName: 'ETH',
    marketName: 'ETHUSDT',
    iconPath: ethIconPath,
  ),
  bnb(
    name: 'Binance Coin',
    tradingName: 'BNB',
    marketName: 'BNBUSDT',
    iconPath: bnbIconPath,
  ),
  usdc(
    name: 'U.S. Dollar Coin',
    tradingName: 'USDC',
    marketName: 'USDCUSDT',
    iconPath: usdcIconPath,
  ),
  xrp(
    name: 'XRP',
    tradingName: 'XRP',
    marketName: 'XRPUSDT',
    iconPath: xrpIconPath,
  ),
  ada(
    name: 'Cardano',
    tradingName: 'ADA',
    marketName: 'ADAUSDT',
    iconPath: adaIconPath,
  ),
  sol(
    name: 'Solana',
    tradingName: 'SOL',
    marketName: 'SOLUSDT',
    iconPath: solIconPath,
  ),
  dot(
    name: 'Polkadot',
    tradingName: 'DOT',
    marketName: 'DOTUSDT',
    iconPath: dotIconPath,
  ),
  doge(
    name: 'Dogecoin',
    tradingName: 'DOGE',
    marketName: 'DOGEUSDT',
    iconPath: dogeIconPath,
  ),
  unknown(
    name: 'unknown',
    tradingName: 'unknown',
    marketName: 'unknown',
    iconPath: 'unknown',
  );

  final String name;
  final String marketName;
  final String tradingName;
  final String iconPath;

  const CryptoDetail({
    required this.name,
    required this.tradingName,
    required this.marketName,
    required this.iconPath,
  });

  factory CryptoDetail.fromName(String name) {
    for (CryptoDetail cd in CryptoDetail.values) {
      if (cd.name == name) {
        return cd;
      }
    }

    return CryptoDetail.unknown;
  }

  factory CryptoDetail.fromTradingName(String tradingName) {
    for (CryptoDetail cd in CryptoDetail.values) {
      if (cd.tradingName == tradingName) {
        return cd;
      }
    }

    return CryptoDetail.unknown;
  }

  factory CryptoDetail.fromMarketName(String marketName) {
    for (CryptoDetail cd in CryptoDetail.values) {
      if (cd.marketName == marketName) {
        return cd;
      }
    }

    return CryptoDetail.unknown;
  }
}
