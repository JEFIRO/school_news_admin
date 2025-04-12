import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Models/AuthModel.dart';
import '../Models/AuthResponse.dart';

Future<Object> loginPage(AuthModel auth) async {
  final url = Uri.parse('http://192.168.86.17:8080/auth/v1/singin');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'email': auth.name, 'passWord': auth.passWord}),
  );

  if (response.statusCode == 200) {
    print('Sucesso: ${response.body}');
    var model = AuthResponse.fromJson(jsonDecode(response.body));
    saveApiKey(model);
    return model;
  } else {
    print('Erro: ${response.statusCode}');
    return 'Erro: ${response.statusCode}';
  }
}

Future<void> saveApiKey(AuthResponse key) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = jsonEncode(key.toJson());
  await prefs.setString('userResponse', jsonString);
}
