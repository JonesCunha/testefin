import 'package:flutter/material.dart';
import 'package:testefin/utils/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.purple,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountEmail: Text("user@mail.com"),
            accountName: Text("Seu zé"),
            currentAccountPicture: CircleAvatar(
              // child: Text("SZ"),
              backgroundImage: NetworkImage('https://i2.wp.com/www.andremassaro.com.br/wp-content/uploads/2021/06/formula-magica-joel-greenblatt.jpg'),
            ),
          ),
          Column(
            children: [
              ListTile(
                  leading: const Icon(Icons.shop),
                  title: const Text('Página Inicial'),
                  onTap: () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet),
                title: const Text('Carteira de Fundos'),
                onTap: () => Navigator.of(context).pushReplacementNamed(AppRoutes.FIISWALLETPAGE),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet),
                title: const Text('Carteira de Ações'),
                onTap: () => Navigator.of(context).pushReplacementNamed(AppRoutes.STOCKSWALLETPAGE),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet),
                title: const Text('Ações Magic Formula Top 20'),
                onTap: () => Navigator.of(context).pushReplacementNamed(AppRoutes.STOCKSHOMEPAGE),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet),
                title: const Text('Fundos S-tier'),
                onTap: () => Navigator.of(context).pushReplacementNamed(AppRoutes.FIISHOMEPAGE),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings_applications),
                title: const Text('Configurações'),
                onTap: () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGSPAGE),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.arrow_outward),
                title: const Text('Sair'),
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
