import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class DetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const DetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name.toUpperCase()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              'assets/images/${pokemon.name}.png',
              height: 150,
            ),

            const SizedBox(height: 20),

            Text("Type: ${pokemon.types.join(", ")}"),
            Text("Height: ${pokemon.height} m"),
            Text("Weight: ${pokemon.weight} kg"),
            Text("Base Exp: ${pokemon.baseExperience}"),

            const SizedBox(height: 20),

            const Text("Stats",
                style: TextStyle(fontWeight: FontWeight.bold)),

            ...pokemon.stats.map((stat) {
              return Text("${stat['name']}: ${stat['value']}");
            }).toList(),
          ],
        ),
      ),
    );
  }
}