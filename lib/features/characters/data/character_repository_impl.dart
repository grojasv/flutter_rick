import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_rick/core/resources/data_state.dart';
import 'package:flutter_rick/features/characters/data/character_mappers.dart';
import 'package:flutter_rick/features/characters/data/local/database/app_database.dart';
import 'package:flutter_rick/features/characters/data/remote/service/characters_api_service.dart';
import 'package:flutter_rick/features/characters/domain/character_repository.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharactersApiService _charactersApiService;
  final AppDatabase _appDatabase;

  CharacterRepositoryImpl(this._charactersApiService, this._appDatabase);

  @override
  Future<DataState<List<CharacterModel>>> getAllCharacters() async {
    try {
      final httpResponse = await _charactersApiService.getAllCharacters(
        page: 1,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.results
            .map((character) => character.toCharacterModel())
            .toList());
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<List<CharacterModel>> getFavoriteCharacters() async {
    final characters = await _appDatabase.characterDao.getCharacters();
    return characters.map((character) => character.toCharacterModel()).toList();
  }

  @override
  Future<void> saveFavoriteCharacter(CharacterModel character) {
    return _appDatabase.characterDao
        .insertCharacter(character.toCharacterEntity());
  }
}
