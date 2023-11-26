import 'package:flutter/material.dart';
import 'package:testefin/data/http/http_client.dart';
import 'package:testefin/data/models/magic_formula_model.dart';
import 'package:testefin/data/repositories/stocks_reposity%20copy.dart';
import 'package:testefin/pages/stores/mf_store.dart';

import '../components/app_drawer.dart';

class StocksHomePage extends StatefulWidget {
  const StocksHomePage({super.key});

  @override
  State<StocksHomePage> createState() => _StocksHomePage();
}

class _StocksHomePage extends State<StocksHomePage> {
  final TextEditingController _filteredItem = TextEditingController();

  final StocksMFStore store = StocksMFStore(
    repository: StocksMFRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    store.getStocks();
  }

  _onSubmit(String? ticker) {
    if (ticker == null) {
      return;
    }
    if (ticker == '') {
      setState(() {
        filtrado = false;
      });
    } else {
      setState(() {
        // store.state.value.where((e) => e.ticker == ticker);
        filtrado = true;
        filteredItems = store.state.value
            .where((e) => e.ticker == ticker.toUpperCase())
            .toList();
      });
    }
  }

  List<MagicFormulaModel> filteredItems = [];
  bool filtrado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Tela de Ações',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                filtrado = false;
                store.getStocks();
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge(
          [
            store.isLoading,
            store.erro,
            store.state,
          ],
        ),
        builder: (context, child) {
          if (store.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (store.erro.value.isNotEmpty) {
            return Center(
              child: Text(
                store.erro.value,
              ),
            );
          }
          if (store.state.value.isEmpty) {
            return const Center(
              child: Text('Nenhum item na lista'),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _filteredItem,
                      onSubmitted: (value) => _onSubmit(value),
                      decoration: const InputDecoration(
                        labelText: 'Filtrar',
                        hintText: 'Digite um termo de pesquisa',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 550,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(4),
                      itemCount: filtrado
                          ? filteredItems.length
                          : store.state.value.length,
                      itemBuilder: (_, index) {
                        final item = filtrado
                            ? filteredItems[index]
                            : store.state.value[index];

                        // final dailyLiquidity = realFormat.format(item.dailyLiquidity);
                        // final realYield = (item.lastDividend / item.unitPrice) * 100;

                        return GestureDetector(
                          // onTap: () => Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => StocksTicker(
                          //       fii: item,
                          //     ),
                          //   ),
                          // ),
                          child: Card(
                            color: Colors.amber[200],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: IconButton(
                                      onPressed: () {
                                        //TODO implementar adicionar o ativo na carteira.
                                      },
                                      icon: const Icon(
                                          Icons.chat_bubble_rounded)),
                                  trailing: IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text( 'Adicionar Ação a Carteira.'),
                                          actions: [
                                            TextButton(onPressed: () {
                                              //TODO implementar adicionar a carteira
                                            }, child: const Text('Sim')),
                                            TextButton(onPressed: () {
                                              Navigator.pop(context);
                                            }, child: const Text('Não')),

                                          ],
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.note_add_sharp),
                                  ),
                                  // onTap: () => print('taped'),
                                  // contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    item.ticker,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 26,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Ticker : ${item.ticker}'),
                                      Text('Empresa : ${item.company}'),
                                      Text('Segmento : ${item.segment}'),
                                      Text('Pontuação : ${item.ranking}'),

                                      // Text('Ult. Yield  : R\$ ${item.lastDividend.toStringAsFixed(2)}',
                                      //   style: const TextStyle(
                                      //       fontWeight: FontWeight.bold,
                                      //       fontSize: 16),
                                      // ),
                                      // Text(
                                      //   'Yield Real % : ${realYield.toStringAsFixed(2)}',
                                      //   style: const TextStyle(
                                      //       fontWeight: FontWeight.bold,
                                      //       fontSize: 16),
                                      // ),
                                    ],
                                  ),
                                ),
                                //TODO implementar o expanded

                                // if (_expanded)
                                //   Container(
                                //     height: 200,
                                //     padding: EdgeInsets.symmetric(
                                //         horizontal: 15, vertical: 4),
                                //     child: ListView(
                                //       children: [
                                //         FittedBox(
                                //           fit: BoxFit.fill,
                                //           child: Text(
                                //             'Liquidez Diária : ${dailyLiquidity}',
                                //             style: const TextStyle(
                                //                 fontWeight: FontWeight.bold),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
