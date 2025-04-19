import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/MemberModel.dart';

Future<List<MemberModel>> findMember() async {
  String jsonString = await recuperarToken();

  final jsonMap = jsonDecode(jsonString);
  final token = jsonMap['token'];
  final schoolId = jsonMap['schoolID'];
  print(token);
  final url = Uri.parse(
    'http://192.168.86.17:8080/auth/v1/allMember/$schoolId',
  );

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    print(response.body);
    final List<dynamic> body = jsonDecode(response.body);

    var x = body.map((json) => MemberModel.fromJson(json)).toList();
    return x;
  } else {
    throw Exception('Erro ao buscar membros: ${response.statusCode}');
  }
}

Future<String> recuperarToken() async {
  final prefs = await SharedPreferences.getInstance();
  var response = prefs.getString('userResponse');
  if (response != null) {
    return response;
  }
  throw Exception('Token não encontrado.');
}

Future<MemberModel?> changePermission(String memberID, String role) async {
  final jsonString = await recuperarToken();
  final jsonMap = jsonDecode(jsonString);
  final token = jsonMap['token'];

  final url = Uri.parse(
    'http://192.168.86.17:8080/api/permission/role/$memberID/$role',
  );

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    return MemberModel.fromJson(jsonDecode(response.body));
  } else {
    print('Erro ao alterar permissão: ${response.statusCode}');
    return null;
  }
}

Future<MemberModel?> blockAccount(String memberID) async {
  final jsonMap = jsonDecode(await recuperarToken());
  final token = jsonMap['token'];

  final url = Uri.parse(
    'http://192.168.86.17:8080/api/permission/blockAccount/$memberID',
  );

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    return MemberModel.fromJson(jsonDecode(response.body));
  } else {
    print("erro ao bloquer o usuario: ${response.statusCode}");
    return null;
  }
}
