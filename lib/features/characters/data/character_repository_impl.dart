import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_rick/core/resources/data_state.dart';
import 'package:flutter_rick/features/characters/data/remote/character_mapper.dart';
import 'package:flutter_rick/features/characters/data/remote/characters_api_service.dart';
import 'package:flutter_rick/features/characters/domain/character_repository.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharactersApiService _charactersApiService;

  CharacterRepositoryImpl(this._charactersApiService);

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
  Future<List<CharacterModel>> getFavoriteCharacters() {
    // TODO: implement getFavoriteCharacters
    throw UnimplementedError();
  }

  @override
  Future<void> removeFavoriteCharacter(CharacterModel character) {
    // TODO: implement removeFavoriteCharacter
    throw UnimplementedError();
  }

  @override
  Future<void> saveFavoriteCharacter(CharacterModel character) {
    // TODO: implement saveFavoriteCharacter
    throw UnimplementedError();
  }
}
