import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/blocs/pokemon_cubit.dart';
import 'package:pokemon_app/screens/pokemon_details.dart';
import 'package:pokemon_app/utils/app_navigator.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonCubit, PokemonState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = PokemonCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.cyan,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text('Poke App'),
              centerTitle: true,
            ),
            body: cubit.pokemonModel == null
                ? const Center(child: CircularProgressIndicator(
              color: Colors.white,
            ))
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      itemCount: cubit.pokemonModel!.pokemon!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.8, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            AppNavigator.appNavigator(context, false, PokemonDetails(pokemon: cubit.pokemonModel!.pokemon![index]));
                          },
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:  cubit.pokemonModel!.pokemon![index].img!,
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        CircularProgressIndicator(value: downloadProgress.progress),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                  Spacer(),
                                  Text(
                                    cubit.pokemonModel!.pokemon![index].name!,
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
          );
        });
  }
}
