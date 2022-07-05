// ignore_for_file: file_names

class StoriesData {
  final String id;
  final String title;
  final String category;
  final String imageAsset;

  const StoriesData({
    required this.id,
    required this.title,
    required this.category,
    required this.imageAsset,
  });
  factory StoriesData.fromMap(Map<String, dynamic> json) {
    return StoriesData(
        id: json['id'],
        title: json['title'],
        category: json['category'],
        imageAsset: json['imageAsset']);
  }
  factory StoriesData.fromJson(Map<String, dynamic> json) {
    return StoriesData(
        id: json['id'],
        title: json['title'],
        category: json['category'],
        imageAsset: json['imageAsset']);
  }
}
