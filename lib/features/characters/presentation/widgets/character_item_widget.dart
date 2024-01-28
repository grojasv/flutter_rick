import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rick/core/utils/string_extensions.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: _onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            height: MediaQuery.of(context).size.width / 3,
            child: Row(
              children: [
                _buildCharacterAvatar(context),
                const SizedBox(width: 16),
                _buildCharacterInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    onCharacterClicked(character);
  }

  Widget _buildCharacterAvatar(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: character.image,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: 50,
        backgroundImage: imageProvider,
      ),
      progressIndicatorBuilder: (context, url, progress) =>
          const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Widget _buildCharacterInfo() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              character.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '${character.gender.toCapitalized()} · ${character.origin.toCapitalized()}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Row(children: [
              const Icon(Icons.cable, size: 16),
              const SizedBox(width: 4),
              Text(
                character.species,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ]),
          ]),
    ));
  }
}
