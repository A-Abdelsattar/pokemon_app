import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/service/dio_helper/dio_helper.dart';

import '../models/pokemon_model.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());
  static PokemonCubit get(context)=>BlocProvider.of(context);

  List<Pokemon>pokemons=[];
  PokemonModel? pokemonModel;

  getAllPokemons(){

    DioHelper.getData(url:'PokemonGO-Pokedex/master/pokedex.json').then((value) {
      emit(PokemonLoadingState());
      var jsonData = jsonDecode(value.data);
      pokemonModel=PokemonModel.fromJson(jsonData);
      emit(PokemonSuccessState());
      return pokemonModel;
    }).catchError((error){
      emit(PokemonErrorState());
      print(error.toString());
    });
  }

}
