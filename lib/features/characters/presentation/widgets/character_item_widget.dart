import 'package:flutter/material.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';

class CharacterItemWidget extends StatelessWidget {
  final CharacterModel character;
  final void Function(CharacterModel character) onCharacterClicked;

  const CharacterItemWidget({
    super.key,
    required this.character,
    required this.onCharacterClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          height: MediaQuery.of(context).size.width / 3,
          child: Text(character.name, style: const TextStyle(fontSize: 18))),
    );
  }

  void _onTap() {
    onCharacterClicked(character);
  }
}
