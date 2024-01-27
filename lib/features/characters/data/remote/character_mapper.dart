import 'package:flutter_rick/features/characters/data/remote/characters_api_response.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';

extension CharacterMapper on CharacterResponse {
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
