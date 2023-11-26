// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MagicFormulaModel {
  String ticker;
  String company;
  String segment;
  int rankingRoic;
  int rankingEv;
  int ranking;
  MagicFormulaModel({
    required this.ticker,
    required this.company,
    required this.segment,
    required this.rankingRoic,
    required this.rankingEv,
    required this.ranking,
  });


  MagicFormulaModel copyWith({
    String? ticker,
    String? company,
    String? segment,
    int? rankingRoic,
    int? rankingEv,
    int? ranking,
  }) {
    return MagicFormulaModel(
      ticker: ticker ?? this.ticker,
      company: company ?? this.company,
      segment: segment ?? this.segment,
      rankingRoic: rankingRoic ?? this.rankingRoic,
      rankingEv: rankingEv ?? this.rankingEv,
      ranking: ranking ?? this.ranking,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ticker': ticker,
      'company': company,
      'segment': segment,
      'rankingRoic': rankingRoic,
      'rankingEv': rankingEv,
      'ranking': ranking,
    };
  }

  factory MagicFormulaModel.fromMap(Map<String, dynamic> map) {
    return MagicFormulaModel(
      ticker: map['ticker'] as String,
      company: map['company'] as String,
      segment: map['segment'] as String,
      rankingRoic: map['rankingRoic'] as int,
      rankingEv: map['rankingEv'] as int,
      ranking: map['ranking'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MagicFormulaModel.fromJson(String source) => MagicFormulaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MagicFormulaModel(ticker: $ticker, company: $company, segment: $segment, rankingRoic: $rankingRoic, rankingEv: $rankingEv, ranking: $ranking)';
  }

  @override
  bool operator ==(covariant MagicFormulaModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.ticker == ticker &&
      other.company == company &&
      other.segment == segment &&
      other.rankingRoic == rankingRoic &&
      other.rankingEv == rankingEv &&
      other.ranking == ranking;
  }

  @override
  int get hashCode {
    return ticker.hashCode ^
      company.hashCode ^
      segment.hashCode ^
      rankingRoic.hashCode ^
      rankingEv.hashCode ^
      ranking.hashCode;
  }
}
