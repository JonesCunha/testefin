import 'package:flutter/material.dart';
import 'package:testefin/components/app_drawer.dart';

class FiisWallet extends StatelessWidget {
  const FiisWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo Carteiras de ações.'),
      ),
      drawer: AppDrawer(),
      body: Text('Carteira'),
    );
  }
}