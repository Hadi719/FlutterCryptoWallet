import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    /*return BlocProvider<Object?>(
      create: (context) => HomeBloc(),
      child: const HomeView(),
    );*/
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AnimatedList(
          padding: const EdgeInsets.all(8),
          itemBuilder: (ctx, index, animation) {
            return Card(
              margin: const EdgeInsets.all(8),
              child: Row(
                children: [Text('data')],
              ),
            );
          },
        ),
      ),
    );
  }
}
