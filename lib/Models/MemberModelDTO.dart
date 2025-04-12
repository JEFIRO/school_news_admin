class MemberModeDTO {
  final String name;
  final String email;
  final String passWord;
  final String image;

  MemberModeDTO({
    required this.name,
    required this.email,
    required this.passWord,
    required this.image,
  });

  factory MemberModeDTO.fromJson(Map<String, dynamic> json) {
    return MemberModeDTO(
      name: json['name'],
      email: json['email'],
      passWord: json['passWord'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'passWord': passWord,
      'image': image,
    };
  }
}
