import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class ApiService {
  static Future<List<Pokemon>> fetchPokemonList() async {
    List<String> names = [
      "alakazam",
      "blastoise",
      "bulbasaur",
      "charizard",
      "dragonite",
      "eevee",
      "flareon",
      "gengar",
      "greninja",
      "gyarados",
      "jolteon",
      "lucario",
      "machamp",
      "pikachu",
      "snorlax",
      "tyranitar",
      "vaporeon",
    ];

    final responses = await Future.wait(
      names.map((name) =>
          http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'))),
    );

    return responses
        .where((res) => res.statusCode == 200)
        .map((res) => Pokemon.fromJson(json.decode(res.body)))
        .toList();
  }
}