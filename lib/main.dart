// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:testefin/pages/fiis_home_page.dart';
import 'package:testefin/pages/fiis_wallet_page.dart';
import 'package:testefin/pages/home_page.dart';
import 'package:testefin/pages/settings_page.dart';
import 'package:testefin/pages/stocks_home_page.dart';
import 'package:testefin/themedata.dart';
import 'package:testefin/utils/routes.dart';

main() {
  //forçar o app nao girar a tela.
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(FinancialAPP());
}

class FinancialAPP extends StatelessWidget {
  const FinancialAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      initialRoute: AppRoutes.HOME,
      // home: MyHomePage(),
      routes: {
          AppRoutes.HOME: (context) => HomePage(),
          AppRoutes.FIISHOMEPAGE: (context) => Fiis_Home_Page(),
          AppRoutes.SETTINGSPAGE: (context) => SettingsPage(),
          AppRoutes.STOCKSHOMEPAGE: (context) => StocksHomePage(),
          AppRoutes.FIISWALLETPAGE: (context) => FiisWallet(),
        },
      //theme: Thema(),
    );
  }
}
