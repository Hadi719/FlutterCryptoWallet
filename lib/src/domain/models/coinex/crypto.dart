import 'package:equatable/equatable.dart';

import '../../../utils/constants/strings.dart';

/// Crypto model based on CoinEx api.
class CoinExCrypto extends Equatable {
  const CoinExCrypto({
    required this.marketName,
    this.minAmount,
    this.markerFeeRate,
    this.takerFeeRate,
    required this.pricingName,
    required this.pricingDecimal,
    required this.tradingName,
    required this.tradingDecimal,
  });

  final String marketName;
  final double? minAmount;
  final double? markerFeeRate;
  final double? takerFeeRate;
  final String pricingName;
  final int pricingDecimal;
  final String tradingName;
  final int tradingDecimal;

  factory CoinExCrypto.fromJson(Map<String, dynamic> jsonData) {
    Map<String, dynamic> data = jsonData['data'];
    return CoinExCrypto(
      marketName: data['name'] ?? '',
      minAmount: double.tryParse(data['min_amount'] ?? kDoubleRevoker),
      markerFeeRate: double.tryParse(data['maker_fee_rate'] ?? kDoubleRevoker),
      takerFeeRate: double.tryParse(data['taker_fee_rate'] ?? kDoubleRevoker),
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
enum CoinExCryptoDetail {
  btc(
    name: 'Bitcoin',
    tradingName: 'BTC',
    marketName: 'BTCUSDT',
    iconPath: kIconPathBTC,
  ),
  eth(
    name: 'Ethereum',
    tradingName: 'ETH',
    marketName: 'ETHUSDT',
    iconPath: kIconPathETH,
  ),
  bnb(
    name: 'Binance Coin',
    tradingName: 'BNB',
    marketName: 'BNBUSDT',
    iconPath: kIconPathBNB,
  ),
  usdc(
    name: 'U.S. Dollar Coin',
    tradingName: 'USDC',
    marketName: 'USDCUSDT',
    iconPath: kIconPathUSDC,
  ),
  xrp(
    name: 'XRP',
    tradingName: 'XRP',
    marketName: 'XRPUSDT',
    iconPath: kIconPathXRP,
  ),
  ada(
    name: 'Cardano',
    tradingName: 'ADA',
    marketName: 'ADAUSDT',
    iconPath: kIconPathADA,
  ),
  sol(
    name: 'Solana',
    tradingName: 'SOL',
    marketName: 'SOLUSDT',
    iconPath: kIconPathSOL,
  ),
  dot(
    name: 'Polkadot',
    tradingName: 'DOT',
    marketName: 'DOTUSDT',
    iconPath: kIconPathDOT,
  ),
  doge(
    name: 'Dogecoin',
    tradingName: 'DOGE',
    marketName: 'DOGEUSDT',
    iconPath: kIconPathDOGE,
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

  const CoinExCryptoDetail({
    required this.name,
    required this.tradingName,
    required this.marketName,
    required this.iconPath,
  });

  factory CoinExCryptoDetail.fromName(String name) {
    for (CoinExCryptoDetail cd in CoinExCryptoDetail.values) {
      if (cd.name == name) {
        return cd;
      }
    }

    return CoinExCryptoDetail.unknown;
  }

  factory CoinExCryptoDetail.fromTradingName(String tradingName) {
    for (CoinExCryptoDetail cd in CoinExCryptoDetail.values) {
      if (cd.tradingName == tradingName) {
        return cd;
      }
    }

    return CoinExCryptoDetail.unknown;
  }

  factory CoinExCryptoDetail.fromMarketName(String marketName) {
    for (CoinExCryptoDetail cd in CoinExCryptoDetail.values) {
      if (cd.marketName == marketName) {
        return cd;
      }
    }

    return CoinExCryptoDetail.unknown;
  }
}
