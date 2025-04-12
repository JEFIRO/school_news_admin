class MemberMode {
  final String id;
  final String name;
  final String role;
  final String image;
  final String dateCreated;
  final String dateUpdated;
  final bool status;
  final bool publishedPermission;
  final bool accountNotLocked;

  MemberMode({
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

  factory MemberMode.fromJson(Map<String, dynamic> json) {
    return MemberMode(
      id: json['_id'],
      name: json['name'],
      role: json['role'],
      image: json['image'],
      dateCreated: json['dateCreated'],
      dateUpdated: json['dateUpdated'],
      status: json['status'],
      publishedPermission: json['publishedPermission'],
      accountNotLocked: json['accountNotLocked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
