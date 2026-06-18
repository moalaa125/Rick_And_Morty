import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/business_logic/cubit/characters_cubit.dart';
import 'package:rickandmorty/constants/strings.dart';
import 'package:rickandmorty/data/api/characters_api.dart';
import 'package:rickandmorty/data/repository/characters_repository.dart';
import 'package:rickandmorty/presentation/screens/characters_details.dart';
import 'package:rickandmorty/presentation/screens/characters_screen.dart';

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
        return MaterialPageRoute(builder: (_) => CharactersDetails());
    }
    return null;
  }
}
