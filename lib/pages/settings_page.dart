import 'package:flutter/material.dart';
import 'package:testefin/components/app_drawer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de configurações'),
      ),
      drawer: AppDrawer(),
      body: Text('A Implementar'),
    );
  }
}