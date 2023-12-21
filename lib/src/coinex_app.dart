import 'package:flutter/material.dart';

import '../development/test_coin_ex_api.dart';
import 'utils/constants/strings.dart' show kAppTitle;

class CoinExApp extends StatelessWidget {
  const CoinExApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
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
