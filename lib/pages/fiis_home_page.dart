import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testefin/data/http/http_client.dart';
import 'package:testefin/data/models/fiis_model.dart';
import 'package:testefin/data/repositories/fiis_reposity.dart';
import 'package:testefin/pages/stores/fiis_store.dart';
import 'package:testefin/pages/ticker.dart';

import '../components/app_drawer.dart';

class Fiis_Home_Page extends StatefulWidget {
  const Fiis_Home_Page({super.key});

  @override
  State<Fiis_Home_Page> createState() => _Fiis_Home_PageState();
}

class _Fiis_Home_PageState extends State<Fiis_Home_Page> {
  TextEditingController _filteredItem = TextEditingController();

  final FiisStore store = FiisStore(
    repository: FiisRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    store.getFiis();
  }

  // _openTransactionFormModal(BuildContext context) {
  //   showModalBottomSheet(
  //       backgroundColor: Colors.purple[400],
  //       shape: Border.all(width: 2),
  //       // useSafeArea: true,
  //       context: context,
  //       // isScrollControlled: true,
  //       builder: (ctx) {
  //         return TransactionForm(onSubmit: _onSubmit);
  //       });
  // }

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

  List<FiisModel> filteredItems = [];
  bool filtrado = false;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _openTransactionFormModal(context);
      //   },
      //   child: const Icon(Icons.search),
      // ),
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Consumo API',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                filtrado = false;
                store.getFiis();
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
                      decoration: InputDecoration(
                        labelText: 'Filtrar',
                        hintText: 'Digite um termo de pesquisa',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Container(
                    height: 550,
                    child: ListView.builder(
                      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      // separatorBuilder: (context, index) => const SizedBox(
                      //   height: 10,
                      // ),
                      padding: const EdgeInsets.all(4),
                      itemCount: filtrado
                          ? filteredItems.length
                          : store.state.value.length,
                      itemBuilder: (_, index) {
                        final item = filtrado
                            ? filteredItems[index]
                            : store.state.value[index];

                        var realFormat = NumberFormat.currency(
                            locale: 'pt_BR', symbol: 'R\$');
                        final netWorh = realFormat.format(item.netWorth);
                        final unitPrice = realFormat.format(item.unitPrice);
                        final dailyLiquidity =
                            realFormat.format(item.dailyLiquidity);
                        final realYield =
                            (item.lastDividend / item.unitPrice) * 100;

                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Ticker(
                                fii: item,
                              ),
                            ),
                          ),
                          child: Card(
                            color: Colors.amber[200],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: IconButton(onPressed: () {
                                    //TODO implementar adicionar o ativo na carteira.
                                    
                                  }, icon: const Icon(Icons.chat_bubble_rounded)),
                                  trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _expanded = !_expanded;
                                      });
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
                                  padding: EdgeInsets.all(4),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Preco Unitario R\$ ${unitPrice}',
                                      ),
                                      Text(
                                        'Valor Mercado R\$ ${netWorh}',
                                      ),
                                      Text(
                                        'Yield Anual : % ${item.dividendYield.toStringAsFixed(2)}',
                                      ),
                                      Text(
                                        'Ult. Yield  : R\$ ${item.lastDividend.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        'Yield Real % : ${realYield.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),

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
