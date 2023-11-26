import 'package:flutter/material.dart';
import 'package:testefin/data/models/stocks_model.dart';
import 'package:testefin/data/repositories/stocks_reposity.dart';
import '../../data/http/exceptions.dart';

class StocksStore {

  final IStocksRepository repository; 
  
  // Variavel reativa para loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variavel reativa para o state

  final ValueNotifier<List<StocksModel>> state =
      ValueNotifier<List<StocksModel>>([]);

  // Variavel rerativa para o erro

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  StocksStore({required this.repository});

  Future getStocks() async {
    isLoading.value = true;

    try {
      final result = await repository.getStocks();
      state.value = result;
    } on NotFoundExcepction catch (e) {
      erro.value = e.message;
    }
    catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }

}
