import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/MemberModel.dart';

Future<Object> findMember() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString('userResponse');

  if (jsonString == null) {
    throw Exception('Token não encontrado.');
  }

  final jsonMap = jsonDecode(jsonString);
  final token = jsonMap['apiKey'];

  final url = Uri.parse('http://192.168.86.17:8080/api/member/allMember');
  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> body = jsonDecode(response.body);

    return body.map((json) => MemberMode.fromJson(json)).toList();
  } else {
    throw Exception('Erro ao buscar membros: ${response.statusCode}');
  }
}
