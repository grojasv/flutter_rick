import 'package:flutter/material.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';

class CharacterDetailsPage extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Text(character.name);
  }
}
