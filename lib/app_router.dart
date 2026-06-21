import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/characters_cubit.dart';
import 'constants/strings.dart';
import 'data/api/characters_api.dart';
import 'data/models/character.dart';
import 'data/repository/characters_repository.dart';
import 'presentation/screens/characters_details_screen.dart';
import 'presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersApi());
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => CharactersCubit(charactersRepository),
            child: CharactersScreen(),
          ),
        );

      case charactersDetailsScreen:
      final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => CharactersDetails(character: character,));
    }
    return null;
  }
}
