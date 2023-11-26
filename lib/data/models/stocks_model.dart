class StocksModel {
  final String id;
  final String lastUpdate;
  final String ticker;
  final String company;
  final String segment;
  final double unitPrice;
  final double earningsPerShare;
  final double priceOverEquity;
  final double dividendYield;
  final double priceOverEbit;
  final double currentLiquidity;
  final double returnOverEquity;
  final double returnOverInvestedCapital;
  final double dailyLiquidity;
  final double netWorth;
  final double netMargin;

  factory StocksModel.fromMap(Map<String, dynamic> map) {
    return StocksModel(
      id: map['id'] ?? '',
      lastUpdate: map['lastUpdate'] ?? '',
      ticker: map['ticker'] ?? '',
      company: map['company'] ?? '',
      segment: map['segment'] ?? '',
      unitPrice: double.tryParse(map['unitPrice'].toString()) ?? 0,
      earningsPerShare: double.tryParse(map['earningPerShare'].toString()) ?? 0,
      priceOverEquity: double.tryParse(map['priceOverEquity'].toString()) ?? 0,
      dividendYield: double.tryParse(map['dividendYield'].toString()) ?? 0,
      priceOverEbit: double.tryParse(map['priceOverEbit'].toString()) ?? 0,
      currentLiquidity: double.tryParse(map['currentLiquidity'].toString()) ?? 0,
      returnOverEquity: double.tryParse(map['returnOverEquity'].toString()) ?? 0,
      returnOverInvestedCapital: double.tryParse(map['returnOverInvestedCapital'].toString()) ?? 0,
      dailyLiquidity: double.tryParse(map['dailyLiquidity'].toString()) ?? 0,
      netWorth: double.tryParse(map['netWorth'].toString()) ?? 0,
      netMargin: double.tryParse(map['netMargin'].toString()) ?? 0,
    );
  }

  StocksModel({
    required this.id,
    required this.lastUpdate,
    required this.ticker,
    required this.company,
    required this.segment,
    required this.unitPrice,
    required this.earningsPerShare,
    required this.priceOverEquity,
    required this.dividendYield,
    required this.priceOverEbit,
    required this.currentLiquidity,
    required this.returnOverEquity,
    required this.returnOverInvestedCapital,
    required this.dailyLiquidity,
    required this.netWorth,
    required this.netMargin});
}
