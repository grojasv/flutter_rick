import 'package:flutter_rick/core/resources/data_state.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';

abstract class CharacterRepository {
  Future<DataState<List<CharacterModel>>> getAllCharacters();

  Future<List<CharacterModel>> getFavoriteCharacters();

  Future<void> saveFavoriteCharacter(CharacterModel character);
}
