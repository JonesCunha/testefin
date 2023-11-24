import 'package:flutter/material.dart';
import 'package:testefin/components/app_drawer.dart';

class StocksHomePage extends StatelessWidget {
  const StocksHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top 20 Ações'),
      ),
      drawer: AppDrawer(),
      
    );
  }
}