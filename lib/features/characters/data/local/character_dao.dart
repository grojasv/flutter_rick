import 'package:floor/floor.dart';
import 'package:flutter_rick/features/characters/data/local/character_entity.dart';

@dao
abstract class CharacterDao {
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCharacter(CharacterEntity characterEntity);

  @Query('SELECT * FROM CharacterEntity')
  Future<List<CharacterEntity>> getCharacters();
}
