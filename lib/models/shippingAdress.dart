// ignore_for_file: file_names

class ShippingAdress {
  final String id;
  final String name;
  final String adress;

  ShippingAdress({
    required this.id,
    required this.name,
    required this.adress,
  });
  factory ShippingAdress.fromJson(Map<String, dynamic> json) {
    print('Json:');
    print(json);
    return ShippingAdress(
      id: json["ID"] ?? "",
      name: json['FullName'] ?? "",
      adress: json['ShippingAddress'] ?? '',
    );
  }
}
