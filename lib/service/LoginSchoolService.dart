import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Models/AuthModel.dart';
import '../Models/AuthResponse.dart';

Future<Object> loginPage(AuthModel auth) async {
  final url = Uri.parse('http://192.168.86.17:8080/api/v1/loginSchool');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'schoolName': "Colegio Estadual Jefferson Vitena",
      'email': "jefiroo@gmail.com",
      'passWord': "81151220",
    }),
  );

  if (response.statusCode == 200) {
    var model = AuthResponse.fromJson(jsonDecode(response.body));
    await saveApiKey(model);
    return model;
  } else {
    print('Erro: ${response.statusCode}');
    return 'Erro: ${response.statusCode}';
  }
}

Future<void> saveApiKey(AuthResponse key) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = jsonEncode(key.toJson());
  debugPrint('[SAVE] Salvando AuthResponse: $jsonString');
  await prefs.setString('userResponse', jsonString);
}
