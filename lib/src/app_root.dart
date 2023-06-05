import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/blocs/pokemon_cubit.dart';
import 'package:pokemon_app/screens/pokemon_list.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => PokemonCubit()..getAllPokemons())],
        child: MaterialApp(
          home: PokemonList(),
        ));
  }
}
