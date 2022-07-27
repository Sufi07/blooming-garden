// ignore_for_file: file_names

// class UserData {
//   int? id;
//   String? name;
//   String? emailAddress;
//   String? paymentMethod;
// }


class UserData {
  final int id;
  final String name;
  final String emailAddress;
  final int paymentMethod;
 
  UserData(
    this.id,
    this.name,
    this.emailAddress,
    this.paymentMethod,
  );
  factory UserData.fromMap(Map<String, dynamic> json) {
    return UserData(json['id'], json['name'], json['emailAddress'], json['paymentMethod']);
  }
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(json['id'], json['name'], json['emailAddress'], json['paymentMethod']);
  }
}