import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick/config/routes/app_router.dart';
import 'package:flutter_rick/config/theme/app_theme.dart';
import 'package:flutter_rick/core/injection_container.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/all/all_characters_bloc.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/all/all_characters_event.dart';
import 'package:flutter_rick/features/characters/presentation/pages/character_overview_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AllCharactersBloc>(
      create: (BuildContext context) => sl()..add(const GetAllCharacters()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: rickAppTheme(),
        onGenerateRoute: AppRouter.onGenerateRoutes,
        home: const CharacterOverviewPage(),
      ),
    );
  }
}
