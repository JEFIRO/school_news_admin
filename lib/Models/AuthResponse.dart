class AuthResponse {
  final String token;
  final String id;
  final String name;
  final String role;
  final String image;
  final String dateCreated;
  final String dateUpdated;
  final bool status;
  final bool publishedPermission;
  final bool accountNotLocked;

  AuthResponse({
    required this.token,
    required this.id,
    required this.name,
    required this.role,
    required this.image,
    required this.dateCreated,
    required this.dateUpdated,
    required this.status,
    required this.publishedPermission,
    required this.accountNotLocked,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token']['token'], // token vindo de dentro do objeto "token"
      id: json['memberDTO']['_id'],
      name: json['memberDTO']['name'],
      role: json['memberDTO']['role'],
      image: json['memberDTO']['image'],
      dateCreated: json['memberDTO']['dateCreated'],
      dateUpdated: json['memberDTO']['dateUpdated'],
      status: json['memberDTO']['status'],
      publishedPermission: json['memberDTO']['publishedPermission'],
      accountNotLocked: json['memberDTO']['accountNotLocked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': {'token': token},
      'memberDTO': {
        '_id': id,
        'name': name,
        'role': role,
        'image': image,
        'dateCreated': dateCreated,
        'dateUpdated': dateUpdated,
        'status': status,
        'publishedPermission': publishedPermission,
        'accountNotLocked': accountNotLocked,
      },
    };
  }
}
