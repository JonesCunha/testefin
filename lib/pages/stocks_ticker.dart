// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../data/models/stocks_model.dart';

class StocksTicker extends StatefulWidget {
  final StocksModel fii;

  const StocksTicker({super.key, required this.fii});

  @override
  State<StocksTicker> createState() => _tickerState();
}

class _tickerState extends State<StocksTicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(
            widget.fii.ticker.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Column(
                children: [
                  Text('Price Over Equity: ${widget.fii.priceOverEquity}'),
                  Text('Preço Unitário: ${widget.fii.unitPrice}'),
                  Text('Yield ${widget.fii.dividendYield}'),
                  Text('Data Update: ${widget.fii.lastUpdate}'),
                  Text('Valor Mercado: ${widget.fii.netWorth}'),
                  // component(widget.fii),
                  GraphTeste(),
                ],
              ),
            )
          ],
        ));
  }
}

class GraphTeste extends StatelessWidget {
  GraphTeste({super.key});

  final List<double> investimentoA = [
    10.0,
    20.0,
    15.0,
    25.0,
    30.0,
    25.0,
    35.0
  ]; // Valores do Investimento A
  final List<double> investimentoB = [
    15.0,
    25.0,
    20.0,
    30.0,
    35.0,
    30.0,
    40.0
  ]; // Valores do Investimento B
  final List<String> labels = [
    'Jan',
    'Fev',
    'Mar',
    'Abr',
    'Mai',
    'Jun',
    'Jul'
  ]; // Rótulos para o eixo X

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Desempenho dos Investimentos',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
