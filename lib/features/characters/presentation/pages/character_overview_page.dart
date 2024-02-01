import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick/core/utils/constants.dart';
import 'package:flutter_rick/core/utils/string_extensions.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/all/all_characters_bloc.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/all/all_characters_state.dart';
import 'package:flutter_rick/features/characters/presentation/pages/details/character_details_model.dart';
import 'package:flutter_rick/features/characters/presentation/widgets/character_item_widget.dart';

class CharacterOverviewPage extends StatelessWidget {
  const CharacterOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Rick & Morty'.hardcoded,
      ),
      actions: [
        GestureDetector(
          onTap: () => _onFavoritesClicked(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark),
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<AllCharactersBloc, AllCharactersState>(
      builder: (context, state) {
        if (state is AllCharactersLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is AllCharactersFailure) {
          //TODO: Add retry mechanism
          return Center(
              child: Text(
                'Sorry, an error has occurred\nTry again later'.hardcoded,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ));
        }
        if (state is AllCharactersEmpty) {
          return Center(
              child: Text(
            'Sorry, there are no characters to display'.hardcoded,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ));
        }
        if (state is AllCharactersSuccess) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return CharacterItemWidget(
                  character: state.characters![index],
                  onCharacterClicked: (character) {
                    _onCharacterClicked(context, character);
                  });
            },
            separatorBuilder: (context, index) => const SizedBox(),
            itemCount: state.characters!.length,
          );
        }
        return const SizedBox();
      },
    );
  }

  void _onCharacterClicked(BuildContext context, CharacterModel character) {
    Navigator.pushNamed(context, routeToCharacterDetails,
        arguments: CharacterDetailsModel(
          character: character,
          isPossibleToFavorite: true,
        ));
  }

  void _onFavoritesClicked(BuildContext context) {
    Navigator.pushNamed(context, routeToFavorites);
  }
}
