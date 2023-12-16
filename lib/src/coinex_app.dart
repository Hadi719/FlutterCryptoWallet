import 'package:flutter/material.dart';

import '../development/test_coin_ex_api.dart';

class CoinExApp extends StatelessWidget {
  const CoinExApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Crypto Wallet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: TestCoinExApi(),
        ),
      ),
    );
  }
}
