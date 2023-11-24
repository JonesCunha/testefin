// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FiisModelWallet {

  String ticker;
  DateTime dtbuy;
  double avgprice;

  FiisModelWallet({
    required this.ticker,
    required this.dtbuy,
    required this.avgprice,
  });

  FiisModelWallet copyWith({
    int? id,
    String? ticker,
    DateTime? dtbuy,
    double? avgprice,
  }) {
    return FiisModelWallet(
      ticker: ticker ?? this.ticker,
      dtbuy: dtbuy ?? this.dtbuy,
      avgprice: avgprice ?? this.avgprice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ticker': ticker,
      'dtbuy': dtbuy.millisecondsSinceEpoch,
      'avgprice': avgprice,
    };
  }

  factory FiisModelWallet.fromMap(Map<String, dynamic> map) {
    return FiisModelWallet(
      ticker: map['ticker'] as String,
      dtbuy: DateTime.fromMillisecondsSinceEpoch(map['dtbuy'] as int),
      avgprice: map['avgprice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory FiisModelWallet.fromJson(String source) => FiisModelWallet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FiisModelWallet(ticker: $ticker, dtbuy: $dtbuy, avgprice: $avgprice)';
  }

  @override
  bool operator ==(covariant FiisModelWallet other) {
    if (identical(this, other)) return true;
  
    return 
      other.ticker == ticker &&
      other.dtbuy == dtbuy &&
      other.avgprice == avgprice;
  }

  @override
  int get hashCode {
    return 
      ticker.hashCode ^
      dtbuy.hashCode ^
      avgprice.hashCode;
  }
}
