import 'package:flutter_rick/core/base/usecase.dart';
import 'package:flutter_rick/features/characters/domain/character_repository.dart';
import 'package:flutter_rick/features/characters/domain/models/character.dart';

class SaveFavoriteCharacter implements UseCase<void, Character> {
  final CharacterRepository _characterRepository;

  SaveFavoriteCharacter(this._characterRepository);

  @override
  Future<void> call({Character? params}) {
    return _characterRepository.saveFavoriteCharacter(params!);
  }
}
