// ignore_for_file: file_names

class PlantGuide {
  final String id;
  final String title;
  final String imageAsset;

  const PlantGuide({
    required this.id,
    required this.title,
    required this.imageAsset,
  });
  factory PlantGuide.fromMap(Map<String, dynamic> json) {
    return PlantGuide(
        id: json['id'], title: json['title'], imageAsset: json['imageAsset']);
  }
  factory PlantGuide.fromJson(Map<String, dynamic> json) {
    return PlantGuide(
      id: json['id'],
      title: json['title'],
      imageAsset: json['imageAsset'],
    );
  }
}
