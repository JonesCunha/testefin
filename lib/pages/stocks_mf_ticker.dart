// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:testefin/data/models/magic_formula_model.dart';

class StocksMFTicker extends StatefulWidget {
  final MagicFormulaModel mfStocks;

  const StocksMFTicker({super.key, required this.mfStocks});

  @override
  State<StocksMFTicker> createState() => _tickerState();
}

class _tickerState extends State<StocksMFTicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(
            widget.mfStocks.ticker.toString(),
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
  const GraphTeste({super.key});
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
