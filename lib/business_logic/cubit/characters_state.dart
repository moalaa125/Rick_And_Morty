part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

class CharachterLoaded extends CharactersState {
  final List<Characters> characters;
  CharachterLoaded(this.characters);
}
