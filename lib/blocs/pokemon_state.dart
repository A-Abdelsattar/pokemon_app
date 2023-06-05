part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadingState extends PokemonState {}

class PokemonSuccessState extends PokemonState {}

class PokemonErrorState extends PokemonState {}
