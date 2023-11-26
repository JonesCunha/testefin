
class StocksWallet {
  //Propriedades :
  String id; //gerar um ID para incluir mais de uma transação / dia
  String ticker; //ação
  DateTime dtbuy; // dt compra
  double avgPrice;
  double quantity; // preço médio

  StocksWallet(
      { 
      required this.id ,
      required this.ticker,
      required this.dtbuy,
      required this.avgPrice,
      required this.quantity});
}
