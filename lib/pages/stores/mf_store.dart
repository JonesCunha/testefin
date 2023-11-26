import 'package:flutter/material.dart';
import 'package:testefin/data/models/magic_formula_model.dart';
import '../../data/http/exceptions.dart';
import '../../data/repositories/stocks_reposity copy.dart';

class StocksMFStore {

  final IStocksMFRepository repository; 
  
  // Variavel reativa para loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variavel reativa para o state

  final ValueNotifier<List<MagicFormulaModel>> state = ValueNotifier<List<MagicFormulaModel>>([]);

  // Variavel rerativa para o erro

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  StocksMFStore({required this.repository});

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
