import 'package:flutter_rick/core/base/usecase.dart';
import 'package:flutter_rick/core/resources/data_state.dart';
import 'package:flutter_rick/features/characters/domain/character_repository.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';

class GetAllCharactersUseCase
    implements UseCase<DataState<List<CharacterModel>>, void> {
  final CharacterRepository _characterRepository;

  GetAllCharactersUseCase(this._characterRepository);

  @override
  Future<DataState<List<CharacterModel>>> call({void params}) {
    return _characterRepository.getAllCharacters();
  }
}
