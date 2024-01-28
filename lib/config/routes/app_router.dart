import 'package:flutter/material.dart';
import 'package:flutter_rick/core/utils/constants.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';
import 'package:flutter_rick/features/characters/presentation/pages/character_details_page.dart';
import 'package:flutter_rick/features/characters/presentation/pages/character_overview_page.dart';
import 'package:flutter_rick/features/characters/presentation/pages/favorites_page.dart';

class AppRouter {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const CharacterOverviewPage());

      case routeToCharacterDetails:
        return _materialRoute(CharacterDetailsPage(
            character: settings.arguments as CharacterModel));

      case routeToFavorites:
        return _materialRoute(const FavoritesPage());

      default:
        return _materialRoute(const CharacterOverviewPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}