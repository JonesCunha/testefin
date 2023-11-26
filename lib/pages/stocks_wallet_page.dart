// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testefin/components/app_drawer.dart';
import 'package:testefin/data/dummy_data/dummy_stocks.dart';
import 'package:testefin/data/models/stocks_wallet.dart';

class StocksWalletPage extends StatefulWidget {
  const StocksWalletPage({super.key});

  @override
  State<StocksWalletPage> createState() => _StocksWalletPageState();
}

class _StocksWalletPageState extends State<StocksWalletPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double height = size.height - AppBar().preferredSize.height;
    double heightAppBar = AppBar().preferredSize.height;
    double width = size.width;

    List<StocksWallet> dummyStock = dummyStocks;

    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              dummyStock.add(StocksWallet(
                  id: '8',
                  ticker: 'Teste',
                  dtbuy: DateTime.now(),
                  avgPrice: 100,
                  quantity: 50));
              setState(() {});
              //TODO Verificar a forma correta de atualizar o grid após uma inclusão/alteração.
            },
            child: Text('Adicionar Novo'),
          ),
        ],
      ),
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('Carteira de ações'),
        elevation: 5,
      ),
      drawer: const AppDrawer(),
      body: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        height: height * 0.8,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10),
            color: Colors.black54),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Altura : $height',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Altura Appbar: $heightAppBar',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Quantidade Elementos : ${dummyStock.length}',
              style: TextStyle(color: Colors.white),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                // reverse: true,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dummyStock.length,
                itemBuilder: (context, index) {
                  var outputFormat = DateFormat('dd/MM/yyyy');
                  var outputDate = outputFormat.format(dummyStock[index].dtbuy);
                  if (index == 0) {
                    return Card(
                      margin: EdgeInsets.all(2),
                      elevation: 5,
                      color: Colors.amber,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Ticker'),
                            Text('Data Compra'),
                            Text('Valor'),
                            Text('Quantidade'),
                            Text('Total')
                          ],
                        ),
                      ),
                    );
                  }
                  return _listStocks(index, dummyStock, outputDate);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _listStocks(
      int index, List<StocksWallet> dummyStock, String outputDate) {
    return InkWell(
      onTap: () {
        print('Tapeed ${dummyStocks[index].ticker}');
      },
      child: Card(
          margin: EdgeInsets.all(4),
          elevation: 5,
          color: Colors.amber,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${dummyStock[index].ticker}'),
                Text('$outputDate'),
                Text('R\$${dummyStock[index].avgPrice.toStringAsFixed(2)}'),
                Text('${dummyStocks[index].quantity.toStringAsFixed(0)}'),
                Text(
                    'R\$${(dummyStocks[index].quantity * dummyStocks[index].avgPrice).toStringAsFixed(2)}'),
              ],
            ),
          )),
    );
  }
}
