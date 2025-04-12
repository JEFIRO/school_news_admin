class AuthModel {
  final String name;
  final String passWord;
  final String email;

  AuthModel({required this.name, required this.email, required this.passWord});

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'passWord': passWord};
  }
}
