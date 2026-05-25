import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class DetailScreen extends StatelessWidget {

  final Pokemon pokemon;

  const DetailScreen({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(
      BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon.name
              .toUpperCase(),
        ),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(
                20),
        child: Column(
          children: [

            Image.asset(
              "assets/images/${pokemon.name}.png",
              height: 200,
            ),

            const SizedBox(
                height: 20),

            Text(
              "Type : ${pokemon.types.join(", ")}",
            ),

            Text(
              "Height : ${pokemon.height} m",
            ),

            Text(
              "Weight : ${pokemon.weight} kg",
            ),

            Text(
              "EXP : ${pokemon.baseExperience}",
            ),

            const SizedBox(
                height: 20),

            const Text(
              "Statistics",
              style: TextStyle(
                fontSize: 20,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
                height: 15),

            ...pokemon.stats.map(
              (e) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      Text(
                          e["name"]),
                      Text(
                        e["value"]
                            .toString(),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}