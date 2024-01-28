import 'package:flutter_rick/features/characters/data/local/character_entity.dart';
import 'package:flutter_rick/features/characters/data/remote/characters_api_response.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';

extension CharacterResponseMapper on CharacterResponse {
  CharacterModel toCharacterModel() {
    return CharacterModel(
      id: id,
      name: name,
      gender: gender.name,
      origin: origin.name,
      image: image,
      status: status,
      species: species,
    );
  }
}

extension CharacterEntityMapper on CharacterEntity {
  CharacterModel toCharacterModel() {
    return CharacterModel(
      id: id,
      name: name,
      gender: gender,
      origin: origin,
      image: image,
      status: status,
      species: species,
    );
  }
}

extension CharacterModelMapper on CharacterModel {
  CharacterEntity toCharacterEntity() {
    return CharacterEntity(
      id: id,
      name: name,
      gender: gender,
      origin: origin,
      image: image,
      status: status,
      species: species,
    );
  }
}