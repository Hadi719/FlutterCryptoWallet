class Crypto {
  Crypto({
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
}

const String btcIconPath = 'assets/crypto_icons/BTC.png';
const String ethIconPath = 'assets/crypto_icons/ETH.png';
const String bnbIconPath = 'assets/crypto_icons/BNB.png';
const String usdcIconPath = 'assets/crypto_icons/USDC.png';
const String xrpIconPath = 'assets/crypto_icons/XRP.png';
const String adaIconPath = 'assets/crypto_icons/ADA.png';
const String solIconPath = 'assets/crypto_icons/SOL.png';
const String dotIconPath = 'assets/crypto_icons/DOT.png';
const String dogeIconPath = 'assets/crypto_icons/DOGE.png';

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

  const CryptoDetail({
    required this.name,
    required this.tradingName,
    required this.marketName,
    required this.iconPath,
  });
  final String name;
  final String marketName;
  final String tradingName;
  final String iconPath;

  factory CryptoDetail.fromName(String name) {
    if (name == CryptoDetail.btc.name) {
      return CryptoDetail.btc;
    }
    if (name == CryptoDetail.eth.name) {
      return CryptoDetail.eth;
    }
    if (name == CryptoDetail.bnb.name) {
      return CryptoDetail.bnb;
    }
    if (name == CryptoDetail.usdc.name) {
      return CryptoDetail.usdc;
    }
    if (name == CryptoDetail.xrp.name) {
      return CryptoDetail.xrp;
    }
    if (name == CryptoDetail.ada.name) {
      return CryptoDetail.ada;
    }
    if (name == CryptoDetail.sol.name) {
      return CryptoDetail.sol;
    }
    if (name == CryptoDetail.dot.name) {
      return CryptoDetail.dot;
    }
    if (name == CryptoDetail.doge.name) {
      return CryptoDetail.doge;
    }

    return CryptoDetail.unknown;
  }

  factory CryptoDetail.fromTradingName(String tradingName) {
    if (tradingName == CryptoDetail.btc.tradingName) {
      return CryptoDetail.btc;
    }
    if (tradingName == CryptoDetail.eth.tradingName) {
      return CryptoDetail.eth;
    }
    if (tradingName == CryptoDetail.bnb.tradingName) {
      return CryptoDetail.bnb;
    }
    if (tradingName == CryptoDetail.usdc.tradingName) {
      return CryptoDetail.usdc;
    }
    if (tradingName == CryptoDetail.xrp.tradingName) {
      return CryptoDetail.xrp;
    }
    if (tradingName == CryptoDetail.ada.tradingName) {
      return CryptoDetail.ada;
    }
    if (tradingName == CryptoDetail.sol.tradingName) {
      return CryptoDetail.sol;
    }
    if (tradingName == CryptoDetail.dot.tradingName) {
      return CryptoDetail.dot;
    }
    if (tradingName == CryptoDetail.doge.tradingName) {
      return CryptoDetail.doge;
    }

    return CryptoDetail.unknown;
  }

  factory CryptoDetail.fromMarketName(String marketName) {
    if (marketName == CryptoDetail.btc.marketName) {
      return CryptoDetail.btc;
    }
    if (marketName == CryptoDetail.eth.marketName) {
      return CryptoDetail.eth;
    }
    if (marketName == CryptoDetail.bnb.marketName) {
      return CryptoDetail.bnb;
    }
    if (marketName == CryptoDetail.usdc.marketName) {
      return CryptoDetail.usdc;
    }
    if (marketName == CryptoDetail.xrp.marketName) {
      return CryptoDetail.xrp;
    }
    if (marketName == CryptoDetail.ada.marketName) {
      return CryptoDetail.ada;
    }
    if (marketName == CryptoDetail.sol.marketName) {
      return CryptoDetail.sol;
    }
    if (marketName == CryptoDetail.dot.marketName) {
      return CryptoDetail.dot;
    }
    if (marketName == CryptoDetail.doge.marketName) {
      return CryptoDetail.doge;
    }

    return CryptoDetail.unknown;
  }
}

extension GetConstTradingName on CryptoDetail {
  String get getTradingNameConst => tradingName;
}
