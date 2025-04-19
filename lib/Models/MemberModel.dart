class MemberModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final String? image;           // <-- Agora pode ser null
  final String? dateCreated;     // <-- Pode ser null
  final String? dateUpdated;     // <-- Pode ser null
  final bool status;
  final bool publishedPermission;
  final bool accountNotLocked;

  MemberModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.image,
    this.dateCreated,
    this.dateUpdated,
    required this.status,
    required this.publishedPermission,
    required this.accountNotLocked,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      image: json['image'], // agora pode vir null
      dateCreated: json['dateCreated'],
      dateUpdated: json['dateUpdated'],
      status: json['status'] ?? false,
      publishedPermission: json['publishedPermission'] ?? false,
      accountNotLocked: json['accountNotLocked'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'role': role,
      'image': image,
      'dateCreated': dateCreated,
      'dateUpdated': dateUpdated,
      'status': status,
      'publishedPermission': publishedPermission,
      'accountNotLocked': accountNotLocked,
    };
  }
}
