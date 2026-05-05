class Pokemon {
  final String name;
  final String image;
  final List<String> types;
  final double height;
  final double weight;
  final int baseExperience;
  final List<Map<String, dynamic>> stats;

  Pokemon({
    required this.name,
    required this.image,
    required this.types,
    required this.height,
    required this.weight,
    required this.baseExperience,
    required this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'] ?? "",

      image: json['sprites']?['other']?['official-artwork']
              ?['front_default'] ??
          "",

      types: (json['types'] as List?)
              ?.map((t) => t['type']['name'].toString())
              .toList() ??
          [],

      height: ((json['height'] ?? 0) as num).toDouble() / 10,
      weight: ((json['weight'] ?? 0) as num).toDouble() / 10,

      baseExperience: json['base_experience'] ?? 0,

      stats: (json['stats'] as List?)
              ?.map((s) => {
                    "name": s['stat']['name'],
                    "value": s['base_stat'],
                  })
              .toList() ??
          [],
    );
  }
}