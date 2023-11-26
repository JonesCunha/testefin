import 'dart:convert';
import 'package:testefin/data/http/exceptions.dart';
import 'package:testefin/data/http/http_client.dart';
import 'package:testefin/data/models/stocks_model.dart';

abstract class IStocksRepository {
  Future<List<StocksModel>> getStocks();
}

class StocksRepository implements IStocksRepository {
  final IHttpClient client;

  StocksRepository({required this.client});

  @override
  Future<List<StocksModel>> getStocks() async {
    const String apiUrl  = 'https://servicehub.ddns.net/services/stocks';
    // const String apiUrl = 'http://10.0.2.2:8080/funds';

    final response = await client.get(url: apiUrl);

    if (response.statusCode == 200) {
      List<StocksModel> stocks = [];
      final body = jsonDecode(response.body);
      stocks = body.map<StocksModel>((item) => StocksModel.fromMap(item)).toList();
      return stocks;
    } else if (response.statusCode == 404) {
      throw NotFoundExcepction('A Url nao é válida');
    } else {
      //print(response.statusCode);
      throw Exception('Não foi possível carregar as Ações');
    }
  }
}
