class User {
  final int id;
  final String name;
  final String phone;
  final String email;

  User({
    required this.email,
    required this.id,
    required this.name,
    required this.phone,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
    );
  }
}
