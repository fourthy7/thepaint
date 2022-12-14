class PaintingsModel {
  final String cover, name, year, artist, description;
  int id;

  PaintingsModel({
    required this.cover,
    required this.name,
    required this.year,
    required this.artist,
    required this.description,
    required this.id,
  });

  factory PaintingsModel.fromJSON(Map parsedJson) {
    return PaintingsModel(
        cover: parsedJson['cover'],
        name: parsedJson['name'],
        year: parsedJson['year'],
        artist: parsedJson['artist'],
        description: parsedJson['description'],
        id: parsedJson['id']);
  }
}
