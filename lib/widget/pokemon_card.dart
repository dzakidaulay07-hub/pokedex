import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  Color getTypeColor(String type) {
    switch (type) {
      case "grass":
        return Colors.green;
      case "fire":
        return Colors.orange;
      case "water":
        return Colors.blue;
      case "electric":
        return Colors.amber;
      case "psychic":
        return Colors.pink;
      case "dragon":
        return Colors.deepPurple;
      case "normal":
        return Colors.grey;
      default:
        return Colors.teal;
    }
  }

  @override
  Widget build(BuildContext context) {
    final type =
        pokemon.types.isNotEmpty ? pokemon.types[0] : "normal";

    return Container(
      decoration: BoxDecoration(
        color: getTypeColor(type),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [

          // Pokeball transparan belakang
          Positioned(
            right: -20,
            bottom: -20,
            child: Opacity(
              opacity: 0.15,
              child: Icon(
                Icons.catching_pokemon,
                size: 100,
                color: Colors.white,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                // Nama
                Text(
                  pokemon.name.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 5),

                // Badge Type
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: Text(
                    type.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ),

                const Spacer(),

                // Gambar Pokemon
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    "assets/images/${pokemon.name}.png",
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}