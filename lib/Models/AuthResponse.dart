import 'package:school_news/Models/MemberModel.dart';

class AuthResponse {
  final String token;
  final MemberModel member;
  final String schoolID;

  AuthResponse({
    required this.token,
    required this.member,
    required this.schoolID,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      schoolID: json['schoolID'],
      member: MemberModel.fromJson(json['member']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'schoolID': schoolID,
      'member': member.toJson(),
    };
  }
}
