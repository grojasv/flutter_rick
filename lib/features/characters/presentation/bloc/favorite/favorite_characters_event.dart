import 'package:equatable/equatable.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';

abstract class FavoriteCharactersEvent extends Equatable {
  final CharacterModel? character;

  const FavoriteCharactersEvent({this.character});

  @override
  List<Object> get props => [character!];
}

class GetFavoriteCharacters extends FavoriteCharactersEvent {
  const GetFavoriteCharacters();
}

class SaveFavorite extends FavoriteCharactersEvent {
  const SaveFavorite(CharacterModel character) : super(character: character);
}
