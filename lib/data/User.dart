class User {
  final int userId;
  final String name;
  final String phone;
  final String code;

  User(this.userId, this.name, this.phone, this.code);

//  factory User.fromJson(Map<String, dynamic> json) {
//    return User(
//        userId: json['userId'],
//        name: json['name'],
//        phone: json['phone'],
//        code: json['code']);
//  }

  Map<String, dynamic> toJson() =>
      {'userId': userId, 'name': name, 'phone': phone, 'code': code};
}
