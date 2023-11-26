import 'dart:convert';
import 'package:testefin/data/http/exceptions.dart';
import 'package:testefin/data/http/http_client.dart';
import 'package:testefin/data/models/magic_formula_model.dart';

abstract class IStocksMFRepository {
  Future<List<MagicFormulaModel>> getStocks();
}

class StocksMFRepository implements IStocksMFRepository {
  final IHttpClient client;

  StocksMFRepository({required this.client});

  @override
  Future<List<MagicFormulaModel>> getStocks() async {
    const String apiUrl  = 'https://servicehub.ddns.net/services/magic-formula';
    // const String apiUrl = 'http://10.0.2.2:8080/funds';

    final response = await client.get(url: apiUrl);

    if (response.statusCode == 200) {
      List<MagicFormulaModel> stocks = [];
      final body = jsonDecode(response.body);
      stocks = body.map<MagicFormulaModel>((item) => MagicFormulaModel.fromMap(item)).toList();
      return stocks;
    } else if (response.statusCode == 404) {
      throw NotFoundExcepction('A Url nao é válida');
    } else {
      //print(response.statusCode);
      throw Exception('Não foi possível carregar as Ações');
    }
  }
}
