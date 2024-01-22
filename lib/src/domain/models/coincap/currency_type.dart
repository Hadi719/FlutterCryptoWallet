/// type of currency - fiat or crypto
enum CurrencyType {
  unknown,
  fiat,
  crypto;

  const CurrencyType();
  factory CurrencyType.fromMap(String? source) {
    if (source == null) return CurrencyType.unknown;
    return CurrencyType.values.firstWhere(
      (element) => element.name == source,
      orElse: () => CurrencyType.unknown,
    );
  }
}
