import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick/core/injection_container.dart';
import 'package:flutter_rick/core/utils/constants.dart';
import 'package:flutter_rick/core/utils/string_extensions.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/favorite/favorite_characters_bloc.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/favorite/favorite_characters_event.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/favorite/favorite_characters_state.dart';
import 'package:flutter_rick/features/characters/presentation/pages/details/character_details_model.dart';
import 'package:flutter_rick/features/characters/presentation/widgets/character_item_widget.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<FavoriteCharactersBloc>()..add(const GetFavoriteCharacters()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('My favorites'.hardcoded),
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<FavoriteCharactersBloc, FavoriteCharactersState>(
      builder: (context, state) {
        if (state is FavoriteCharactersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavoriteCharactersSuccess) {
          return _buildFavoritesList(state.characters!);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildFavoritesList(List<CharacterModel> characters) {
    if (characters.isEmpty) {
      return Center(
          child: Text(
        'No favourite characters selected yet!'.hardcoded,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18),
      ));
    }

    return ListView.separated(
      itemBuilder: (context, index) {
        return CharacterItemWidget(
            character: characters[index],
            onCharacterClicked: (character) {
              _onCharacterClicked(context, character);
            });
      },
      separatorBuilder: (context, index) => const SizedBox(),
      itemCount: characters.length,
    );
  }

  void _onBackButtonTapped(BuildContext context) => Navigator.pop(context);

  void _onCharacterClicked(BuildContext context, CharacterModel character) {
    Navigator.pushNamed(context, routeToCharacterDetails,
        arguments: CharacterDetailsModel(
          character: character,
          isPossibleToFavorite: false,
        ));
  }
}
