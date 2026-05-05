import 'package:flutter/material.dart';
import 'package:pokedex/services/api_services.dart';
import '../models/pokemon.dart';
import '../widget/pokemon_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Pokemon>> futurePokemon;

  List<Pokemon> allPokemon = [];
  List<Pokemon> filteredPokemon = [];

  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    futurePokemon = ApiService.fetchPokemonList();
  }

  void filterPokemon() {
    final results = allPokemon.where((pokemon) {
      return pokemon.name
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();

    setState(() {
      filteredPokemon = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokedex"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: futurePokemon,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error"));
          }

          if (allPokemon.isEmpty) {
            allPokemon = snapshot.data!;
            filteredPokemon = allPokemon;
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  onChanged: (value) {
                    searchQuery = value;
                    filterPokemon();
                  },
                  decoration: InputDecoration(
                    hintText: "Search Pokémon...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: filteredPokemon.length,
                  itemBuilder: (context, index) {
                    final pokemon = filteredPokemon[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                DetailScreen(pokemon: pokemon),
                          ),
                        );
                      },
                      child: PokemonCard(pokemon: pokemon),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}