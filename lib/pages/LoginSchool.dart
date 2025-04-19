import 'package:flutter/material.dart';
import 'package:school_news/Models/AuthModel.dart';

import '../service/LoginSchoolService.dart';
import 'HomeAdmPage.dart';

class Loginschool extends StatelessWidget {
  Loginschool({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController schoolEmailController = TextEditingController();
  final TextEditingController schoolPassWordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: const BoxDecoration(
                color: Color(0xFFC2185B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "SchoolNews",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Icon(Icons.school, size: 80),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Aqui começa o Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: TextFormField(
                      controller: schoolNameController,
                      decoration: const InputDecoration(
                        labelText: 'Name of School',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Endereço da escola é obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: TextFormField(
                      controller: schoolEmailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email da escola é obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: TextFormField(
                      controller: schoolPassWordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Senha da escola é obrigatória';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFC2185B),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final login = AuthModel(
                              name: schoolNameController.text,
                              email: schoolEmailController.text,
                              passWord:
                                  schoolPassWordController
                                      .text, // Corrigido aqui
                            );

                            var response = await loginPage(login);

                            print(response);

                            if (response != null && response != 'erro') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeAdmPage(),
                                ),
                              );
                            }
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Fora do Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                child: Text(
                  "Ou",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFC2185B),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.g_mobiledata, size: 30, color: Colors.black),
                      Text(
                        "Login with Google",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
