import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flow_builder/flow_builder.dart' show FlowBuilder;
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
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocProvider, SelectContext;

import '../../../config/router/router.dart';
import '../../../config/utils/constants/strings.dart' show kAppTitle;
import '../../../service_locator.dart';
import '../bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

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
      home: FlowBuilder<AppStatus>(
        /// TODO: Add Firebase Navigation Observer.
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
        observers: [
          FirebaseAnalyticsObserver(
            analytics: serviceLocator<FirebaseAnalytics>(),
          ),
        ],
      ),
    );
  }
}
