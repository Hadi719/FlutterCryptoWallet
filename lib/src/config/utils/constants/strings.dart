// App
const String kAppTitle = 'Flutter Crypto Wallet';

// Assets - Icons
const String kIconPathADA = '${kIconsDirPath}ADA.png';
const String kIconPathBNB = '${kIconsDirPath}BNB.png';
const String kIconPathBTC = '${kIconsDirPath}BTC.png';
const String kIconPathDOGE = '${kIconsDirPath}DOGE.png';
const String kIconPathDOT = '${kIconsDirPath}DOT.png';
const String kIconPathETH = '${kIconsDirPath}ETH.png';
const String kIconPathSOL = '${kIconsDirPath}SOL.png';
const String kIconPathUSDC = '${kIconsDirPath}USDC.png';
const String kIconPathUSDT = '${kIconsDirPath}USDT.png';
const String kIconPathXRP = '${kIconsDirPath}XRP.png';

const String kIconsDirPath = 'assets/images/icons/crypto_icons/';

// Utils
/// Making [int.tryParse()] returns null instead of an error;
///
/// ```dart
/// int.tryParse(map['maxSupply'] ?? kIntRevoker);
/// ```
const String kIntRevoker = '1f';

/// Making [double.tryParse()] returns null instead of an error;
///
/// ```dart
/// double.tryParse(map['maxSupply'] ?? kDoubleRevoker);
/// ```
const String kDoubleRevoker = '0xFF';
