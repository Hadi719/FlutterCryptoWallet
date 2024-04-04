import 'package:flutter/material.dart'
    show
        Align,
        Alignment,
        AppBar,
        BuildContext,
        Column,
        Icon,
        IconButton,
        Icons,
        Key,
        MainAxisSize,
        MaterialPage,
        Page,
        Scaffold,
        SizedBox,
        StatelessWidget,
        Text,
        Theme,
        Widget;
import 'package:flutter_bloc/flutter_bloc.dart' show SelectContext, ReadContext;

import '../../app/bloc/app_bloc.dart';
import '../widgets/avatar.dart';

class ProfilePage extends StatelessWidget {
  static const String screenName = '/Profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: <Widget>[
          IconButton(
            key: const Key('profilePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AppBloc>().add(const AppLogoutRequested());
            },
          ),
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Avatar(photo: user.photo),
            const SizedBox(height: 4),
            Text(user.email ?? '', style: textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(user.name ?? '', style: textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }

  static Page<void> page() => const MaterialPage<void>(
        child: ProfilePage(),
        name: screenName,
      );
}
