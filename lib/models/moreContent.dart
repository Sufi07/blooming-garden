// ignore_for_file: file_names

class Tag {
  String name;
  int id;
  String img;
  String routeName;
  Tag(this.name, this.id, this.img, this.routeName);

  factory Tag.fromJson(dynamic json) {
    return Tag(json['name'] as String, json['id'] as int, json['img'] as String,
        json['routeName'] as String);
  }

  @override
  String toString() {
    return '{ $name, $id , $img,$routeName }';
  }
}
