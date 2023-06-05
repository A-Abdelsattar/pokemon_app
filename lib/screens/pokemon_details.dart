import 'package:flutter/material.dart';

import '../models/pokemon_model.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetails({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('${pokemon.name}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              // height: 500,
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 50,),
                  Text(
                    '${pokemon.name}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text('Height: ${pokemon.height}'),
                  Text('Weight: ${pokemon.weight}'),
                  Text(
                    'Types',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type!
                        .map((e) => Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(e)))
                        .toList(),
                  ),
                  Text(
                    'Weakness',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: (pokemon.weaknesses ?? [])
                        .map((e) => Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(e)))
                        .toList(),
                  ),
                  Text(
                    'Next Evolution',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: (pokemon.nextEvolution ?? [])
                        .map(
                          (e) => Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              e.name.toString(),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            Container(height: 200, child: Image.network('${pokemon.img}', errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error_outline_rounded, size: 100,);
            },)),
          ],
        ),
      ),
    );
  }
}
