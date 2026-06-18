import 'package:flutter/material.dart';
import 'package:rickandmorty/constants/strings.dart';
import 'package:rickandmorty/presentation/screens/characters_details.dart';
import 'package:rickandmorty/presentation/screens/characters_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (_) => CharactersScreen());

        
      case charactersDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharactersDetails());
    }
    return null;
  }
}
