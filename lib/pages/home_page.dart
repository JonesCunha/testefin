import 'package:flutter/material.dart';
import 'package:testefin/components/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Pagina Inicial'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: 
          Image.network(
            'https://m.media-amazon.com/images/I/41qKVROepZL._SY445_SX342_.jpg',
            fit: BoxFit.fill,
          )
        ,
      ),
    );
  }
}
