class PokemonModel {
  List<Pokemon>? pokemon;

  PokemonModel({this.pokemon});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = <Pokemon>[];
      json['pokemon'].forEach((v) {
        pokemon!.add(Pokemon.fromJson(v));
      });
    }
  }


}

class Pokemon {
  int? id;
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  String? egg;
  String? spawnTime;
  List<String>? weaknesses;
  List<NextEvolution>? nextEvolution;

  Pokemon(
      {this.id,
        this.num,
        this.name,
        this.img,
        this.type,
        this.height,
        this.weight,
        this.candy,
        this.egg,

        this.spawnTime,
        this.weaknesses,
        this.nextEvolution,
        });

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    egg = json['egg'];

    spawnTime = json['spawn_time'];

    weaknesses = json['weaknesses'].cast<String>();
    if (json['next_evolution'] != null) {
      nextEvolution = <NextEvolution>[];
      json['next_evolution'].forEach((v) {
        nextEvolution!.add(NextEvolution.fromJson(v));
      });
    }

  }


}

class NextEvolution {
  String? num;
  String? name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }


}