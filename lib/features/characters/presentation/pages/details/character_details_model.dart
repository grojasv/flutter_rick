import 'package:flutter_rick/features/characters/domain/models/character_model.dart';

class CharacterDetailsModel {
  CharacterModel character;
  bool isPossibleToFavorite;

  CharacterDetailsModel({
    required this.character,
    this.isPossibleToFavorite = false,
  });
}
