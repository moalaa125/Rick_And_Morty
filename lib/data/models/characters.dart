class Characters {
  late int id;
  late String name;
  late String status;
  late String species;
  late String gender;
  late String image;
  late List<dynamic> appearnceOfSeasons;

  Characters({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.appearnceOfSeasons,
  });

  Characters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    gender = json['gender'];
    image = json['image'];
    appearnceOfSeasons = json['episode'];
  }
}
