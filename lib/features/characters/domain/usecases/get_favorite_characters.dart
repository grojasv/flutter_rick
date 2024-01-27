import 'package:flutter_rick/core/base/usecase.dart';
import 'package:flutter_rick/features/characters/domain/character_repository.dart';
import 'package:flutter_rick/features/characters/domain/models/character.dart';

class GetFavoriteCharacters implements UseCase<List<Character>, void> {
  final CharacterRepository _characterRepository;

  GetFavoriteCharacters(this._characterRepository);

  @override
  Future<List<Character>> call({void params}) {
    return _characterRepository.getFavoriteCharacters();
  }
}
