import 'package:flutter/material.dart'
    show
        BuildContext,
        ColorScheme,
        Colors,
        MaterialApp,
        StatelessWidget,
        ThemeData,
        ThemeMode,
        Widget;

import '../src/config/utils/constants/strings.dart' show kAppTitle;
import 'dev_coin_api.dart' show DevCoinApi;

class DevApp extends StatelessWidget {
  const DevApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const DevCoinApi(),
    );
  }
}
