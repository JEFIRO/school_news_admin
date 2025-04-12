import 'MemberModelDTO.dart';

class SchoolNewsDTO {
  final String schoolName;
  final String schoolPhone;
  final String schoolEndereco;
  final MemberModeDTO memberMode;

  SchoolNewsDTO({
    required this.schoolName,
    required this.schoolPhone,
    required this.schoolEndereco,
    required this.memberMode,
  });

  factory SchoolNewsDTO.fromJson(Map<String, dynamic> json) {
    return SchoolNewsDTO(
      schoolName: json['schoolName'],
      schoolPhone: json['schoolPhone'],
      schoolEndereco: json['schoolEndereco'],
      memberMode: MemberModeDTO.fromJson(json['memberMode']),
    );
  }
}

