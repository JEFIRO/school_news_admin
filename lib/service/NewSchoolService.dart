import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/SchoolNewsDTO.dart';

Future<String> enviarNoticia(SchoolNewsDTO member) async {
  final url = Uri.parse('http://192.168.86.17:8080/api/v1/newSchool');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'schoolName': member.schoolName,
      'schoolPhone': member.schoolPhone,
      'schoolEndereco': member.schoolEndereco,
      'memberMode': {
        'name': member.memberMode.name,
        'email': member.memberMode.email,
        'passWord': member.memberMode.passWord,
        'image': member.memberMode.image,
      },
    }),
  );

  if (response.statusCode == 200) {
    print('Sucesso: ${response.body}');
    return response.body;
  } else {
    print('Erro: ${response.statusCode}');
    return 'Erro: ${response.statusCode}';
  }
}
