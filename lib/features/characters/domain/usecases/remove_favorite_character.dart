import 'package:flutter_rick/core/base/usecase.dart';
import 'package:flutter_rick/features/characters/domain/character_repository.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';

class RemoveFavoriteCharacterUseCase implements UseCase<void, CharacterModel> {
  final CharacterRepository _characterRepository;

  RemoveFavoriteCharacterUseCase(this._characterRepository);

  @override
  Future<void> call({CharacterModel? params}) {
    return _characterRepository.removeFavoriteCharacter(params!);
  }
}
