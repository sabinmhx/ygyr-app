class User {
  int id;
  String name;
  String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'email': String email,
      } =>
        User(
          name: name,
          id: id,
          email: email,
        ),
      _ => throw const FormatException('Failed to load user.'),
    };
  }
}
