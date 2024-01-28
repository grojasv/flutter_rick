import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick/core/injection_container.dart';
import 'package:flutter_rick/core/utils/string_extensions.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/favorite/favorite_characters_bloc.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/favorite/favorite_characters_event.dart';

class CharacterDetailsPage extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetailsPage({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<FavoriteCharactersBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(character.name),
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(height: 30),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 165),
              child: _buildCharacterCard(context),
            ),
            _buildCharacterAvatar(context)
          ],
        ),
      ],
    ));
  }

  Widget _buildCharacterAvatar(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: character.image,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: 100,
        backgroundColor: const Color.fromARGB(255, 249, 243, 251),
        child: Padding(
          padding: const EdgeInsets.all(8), // Border radius
          child: ClipOval(
              child: Image(
            image: imageProvider,
          )),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) =>
          const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Widget _buildCharacterCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildCharacterRow(
                  Icons.numbers, '${character.id}. ${character.name}'),
              _buildCharacterRow(
                  Icons.location_pin, character.origin.toCapitalized()),
              _buildCharacterRow(Icons.cable, character.species),
              _buildCharacterRow(
                  Icons.person, character.gender.toCapitalized()),
              _buildCharacterRow(
                  Icons.stacked_bar_chart, character.status.toCapitalized()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => _onFloatingActionButtonPressed(context),
        child: const Icon(Icons.bookmark),
      ),
    );
  }

  Widget _buildCharacterRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) => Navigator.pop(context);

  void _onFloatingActionButtonPressed(BuildContext context) {
    BlocProvider.of<FavoriteCharactersBloc>(context)
        .add(SaveFavorite(character));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        content: Text('${character.name} added to favorites'.hardcoded),
      ),
    );
  }
}
