import 'package:flutter_rick/core/base/usecase.dart';
import 'package:flutter_rick/features/characters/domain/character_repository.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';

class GetFavoriteCharactersUseCase
    implements UseCase<List<CharacterModel>, void> {
  final CharacterRepository _characterRepository;

  GetFavoriteCharactersUseCase(this._characterRepository);

  @override
  Future<List<CharacterModel>> call({void params}) {
    return _characterRepository.getFavoriteCharacters();
  }
}
