import 'package:flutter_rick/core/resources/data_state.dart';
import 'package:flutter_rick/features/characters/domain/models/character.dart';

abstract class CharacterRepository {
  Future<DataState<List<Character>>> getAllCharacters();

  Future<List<Character>> getFavoriteCharacters();

  Future<void> saveFavoriteCharacter(Character character);

  Future<void> removeFavoriteCharacter(Character character);
}
